#!/usr/bin/env ruby

# Use ENV version, if it doesn't exist, exit
# Find the ""Release notes"" in said version
# Pull all the release info from Redmine

require 'uri'
require 'net/http'
require 'json'

URL = 'https://projects.theforeman.org'

unless ARGV.size == 2
  puts "Usage: #{$0} PROJECT RELEASE_NAME"
  puts "Example: #{$0} foreman 1.18.0"
  exit 1
end

@project_name = ARGV[0]
@current_release_name = ARGV[1]

# Additional projects to include in release notes
# Both hammer-cli and hammer-cli-foreman versions are stored in the 'hammer-cli' project
ADDITIONAL_PROJECTS = [
  { project: 'hammer-cli', version_prefix: 'hammer-cli-' },
  { project: 'hammer-cli', version_prefix: 'hammer-cli-foreman-' }
].freeze

# Category mappings and transformations
CATEGORY_MAPPINGS = {
  # Merge categories - source categories are merged into target category
  merge: {
    'Smart Proxy' => ['Smart Proxy - Core'],
    'SELinux' => ['SELinux - General Foreman']
  },

  # Rename categories - simple string replacements using regex patterns
  rename: {
    /^Hammer CLI$/ => 'Hammer CLI',  # Keep as-is for base hammer-cli
  },

  # Project-specific category transformations
  project_specific: {
    'hammer-cli-foreman-' => {
      /^Hammer CLI/ => 'Hammer CLI - Foreman'
    }
  }
}.freeze

def url_to_json(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# Determine version
def get_version_id(project, release_name = @current_release_name)
  url = "#{URL}/projects/#{project}/versions.json"
  result = url_to_json(url)
  return nil if result['versions'].nil?
  # Find version with matching name (e.g., "3.16.0" or "hammer-cli-3.16.0")
  result = result['versions'].detect{|v| v['name'] == release_name }
  return nil if result.nil?
  result['id']
rescue StandardError => e
  puts "Error getting version list from #{url}: #{e}"
  return nil
end

@current_release_id = get_version_id(@project_name)

if @current_release_id.nil?
  puts "Release #{@current_release_name} not found in project #{@project_name}"
  exit 1
end

def gather_issues(project_name, release_id, offset = 0)
  params = {
    'status_id' => 'closed',
    'offset' => offset,
    'limit' => 100,
    'f[]' => 'cf_12',           # Filter by custom field 12 (Fix version)
    'op[cf_12]' => '=',         # Operator: equals
    'v[cf_12][]' => release_id, # Value: the release ID we want
  }
  url = "#{URL}/issues.json?#{URI.encode_www_form(params)}"
  result = url_to_json(url)
  # Recursively fetch all pages of results (Redmine paginates at 100 items)
  if result['total_count'].to_i - offset - 100 <= 0
    result['issues']
  else
    result['issues'] += gather_issues(project_name, release_id, offset + 100)
  end
end


puts "Copy and paste the following into the release notes section of the relevant manual:"

puts "\n----------[Start of notes]----------\n\n"

def apply_category_mappings(grouped_issues, version_prefix = nil)
  # Step 1: Handle merge mappings
  CATEGORY_MAPPINGS[:merge].each do |target_category, source_categories|
    grouped_issues[target_category] ||= []  # Initialize if doesn't exist
    source_categories.each do |source_category|
      if grouped_issues.key?(source_category)
        # Move issues from source to target category and remove source
        grouped_issues[target_category] += grouped_issues.delete(source_category)
      end
    end
  end

  # Step 2: Apply project-specific transformations
  if version_prefix && CATEGORY_MAPPINGS[:project_specific][version_prefix]
    new_grouped_issues = {}
    transformations = CATEGORY_MAPPINGS[:project_specific][version_prefix]

    grouped_issues.each do |category, category_issues|
      new_category = category
      # Apply each regex pattern transformation for this project
      transformations.each do |pattern, replacement|
        new_category = new_category.gsub(pattern, replacement)
      end
      new_grouped_issues[new_category] = category_issues
    end
    grouped_issues = new_grouped_issues
  end

  # Step 3: Apply general rename mappings
  new_grouped_issues = {}
  grouped_issues.each do |category, category_issues|
    new_category = category
    CATEGORY_MAPPINGS[:rename].each do |pattern, replacement|
      new_category = new_category.gsub(pattern, replacement)
    end
    new_grouped_issues[new_category] = category_issues
  end

  new_grouped_issues
end

def generate_release_notes_for_project(project_name, release_name, version_prefix = nil)
  # Build full version name (e.g., "hammer-cli-3.16.0" instead of just "3.16.0")
  full_version_name = version_prefix ? "#{version_prefix}#{release_name}" : release_name
  release_id = get_version_id(project_name, full_version_name)
  return if release_id.nil?

  issues = gather_issues(project_name, release_id)
  return if issues.empty?

  # Group issues by "Project Name" or "Project Name - Category" format
  grouped_issues = issues.group_by { |issue| "#{issue['project']['name']}#{ ' - ' + issue['category']['name'] if issue.key?('category') }" }

  # Apply configurable category mappings
  grouped_issues = apply_category_mappings(grouped_issues, version_prefix)

  # Sort categories alphabetically
  grouped_issues = Hash[ grouped_issues.sort_by { |key, val| key } ]

  grouped_issues.each do |category, category_issues|
    next if category_issues.empty?
    puts "#### #{category}"

    category_issues.each do |issue|
      # Escape markdown special characters in issue subject
      escaped_subject = issue['subject'].gsub('`','\\\`').gsub('<','&lt;').gsub('>','&gt;').gsub('*','\\\*')
      puts "* #{escaped_subject} ([##{issue['id']}](#{URL}/issues/#{issue['id']}))"
    end

    puts
  end
end

puts "### Release notes for #{@current_release_name}"

# Generate notes for main project
generate_release_notes_for_project(@project_name, @current_release_name)

# Generate notes for additional projects (Hammer CLI components)
ADDITIONAL_PROJECTS.each do |project_config|
  generate_release_notes_for_project(project_config[:project], @current_release_name, project_config[:version_prefix])
end

puts "*A full list of changes in #{@current_release_name} is available via [Redmine](https://projects.theforeman.org/issues?set_filter=1&sort=id%3Adesc&status_id=closed&f[]=cf_12&op[cf_12]=%3D&v[cf_12]=#{@current_release_id})*"

puts "\n----------[End of notes]----------\n"

# Close the releases
puts "If this isn't an RC release, the relevant releases should be closed:"
puts "Close the release #{URL}/versions/#{@current_release_id}/edit"

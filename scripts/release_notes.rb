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

def url_to_json(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# Determine version
def get_version_id(project)
  url = "#{URL}/projects/#{project}/versions.json"
  result = url_to_json(url)
  return nil if result['versions'].nil?
  result = result['versions'].detect{|v| v['name'] == @current_release_name }
  return nil if result.nil?
  result['id']
rescue StandardError => e
  puts "Error getting version list from #{url}: #{e}"
  exit 1
end

@current_release_id = get_version_id(@project_name)

if @current_release_id.nil?
  puts "Release #{@current_release_name} not found in any of the projects #{@project_name}"
  exit 1
end

def gather_issues(offset = 0)
  params = {
    'status_id' => 'closed',
    'offset' => offset,
    'limit' => 100,
    'f[]' => 'cf_12',
    'op[cf_12]' => '=',
    'v[cf_12][]' => @current_release_id,
  }
  url = "#{URL}/issues.json?#{URI.encode_www_form(params)}"
  result = url_to_json(url)
  if result['total_count'].to_i - offset - 100 <= 0
    result['issues']
  else
    result['issues'] += gather_issues(offset + 100)
  end
end


puts "Copy and paste the following into the release notes section of the relevant manual:"

puts "\n----------[Start of notes]----------\n\n"

puts "### Release notes for #{@current_release_name}"

grouped_issues = gather_issues.group_by { |issue| "#{issue['project']['name']}#{ ' - ' + issue['category']['name'] if issue.key?('category') }" }

grouped_issues['Smart Proxy'] ||= []
grouped_issues['SELinux'] ||= []
grouped_issues['Smart Proxy'] += grouped_issues.delete('Smart Proxy - Core') if grouped_issues.key?('Smart Proxy - Core')
grouped_issues['SELinux'] += grouped_issues.delete('SELinux - General Foreman') if grouped_issues.key?('SELinux - General Foreman')
grouped_issues = Hash[ grouped_issues.sort_by { |key, val| key } ]
grouped_issues.each do |category, issues|
  next if issues.empty?
  puts "#### #{category}"

  issues.each do |issue|
    puts "* #{issue['subject'].gsub('`','\\\`').gsub('<','&lt;').gsub('>','&gt;').gsub('*','\\\*')} ([##{issue['id']}](#{URL}/issues/#{issue['id']}))"
  end

  puts
end

puts "*A full list of changes in #{@current_release_name} is available via [Redmine](https://projects.theforeman.org/issues?set_filter=1&sort=id%3Adesc&status_id=closed&f[]=cf_12&op[cf_12]=%3D&v[cf_12]=#{@current_release_id})*"

puts "\n----------[End of notes]----------\n"

# Close the releases
puts "If this isn't an RC release, the relevant releases should be closed:"
puts "Close the release #{URL}/versions/#{@current_release_id}/edit"

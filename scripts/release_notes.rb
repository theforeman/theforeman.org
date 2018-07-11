#!/usr/bin/env ruby

# Use ENV version, if it doesn't exist, exit
# Find the ""Release notes"" in said version
# Pull all the release info from Redmine

require 'uri'
require 'net/http'
require 'json'

URL = 'https://projects.theforeman.org'

# Check out installer modules
# Compare packages in nightly vs release and retag dependencies

# Create new release via API call
# Create new search by open + release field

unless ARGV.size == 2
  puts "Usage: #{$0} PROJECT RELEASE_NAME"
  puts "Example: #{$0} foreman 1.18.0"
  exit 1
end

@project_name = ARGV[0]
@current_release_name = ARGV[1]

# Determine version
def get_version_id
  url = "#{URL}/projects/#{@project_name}/versions.json"
  uri = URI(URI.escape(url))
  response = Net::HTTP.get(uri)
  result = JSON.parse(response)
  return nil if result['versions'].nil?
  result = result['versions'].detect{|v| v['name'] == @current_release_name }
  return nil if result.nil?
  result['id']
rescue
  puts "Error getting version list from #{url}"
  exit 1
end

@current_release_id = get_version_id

if @current_release_id.nil?
  puts "Release #{@current_release_name} not found in project #{@project_name}"
  exit 1
end

# Move bugs with Release set to VERSION to NEXT-VERSION with status new
def gather_issues(offset=0)
  url = "#{URL}/projects/#{@project_name}/issues.json?status_id=closed&offset=#{offset}&limit=100&fixed_version_id=#{@current_release_id}"
  uri = URI(URI.escape(url))
  response = Net::HTTP.get(uri)
	result = JSON.parse(response)
	if result['total_count'].to_i - offset - 100 <= 0
		result['issues']
	else
		result['issues'] += gather_issues(offset + 100)
	end
end

def modify_target_version!(issue_id, options)
  uri = URI(URI.escape("#{URL}/issues/#{issue_id}.json"))
  req = Net::HTTP::Put.new(
		uri,
		{ 'Content-Type' => 'application/json',
		  'X-Redmine-API-Key' => File.read('~/.redminekey') }
	)
  Net::HTTP.new(uri.host, uri.port).start {|http| http.request(req) }
end

grouped_issues = gather_issues.group_by { |issue| issue['category']['name'] rescue 'Uncategorized' }

grouped_issues = Hash[ grouped_issues.sort_by { |key, val| key } ]
grouped_issues.each do |category, issues|
	puts "#### #{category}"

  issues.each do |issue|
	  puts "* #{issue['subject']} ([##{issue['id']}](#{URL}/issues/#{issue['id']}))"
  end

  puts
end

# Close the release
puts "Close the release #{URL}/versions/#{@current_release_id}/edit - not possible to do through the API (yet)"

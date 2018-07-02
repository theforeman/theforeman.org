#!/usr/bin/env ruby

# Use ENV version, if it doesn't exist, exit
# Find the ""Release notes"" in said version
# Pull all the release info from Redmine

require 'uri'
require 'net/http'
require 'json'
require 'pry-byebug'

URL = 'https://projects.theforeman.org'

# Check out installer modules
# Compare packages in nightly vs release and retag dependencies

# Create new release via API call
# Create new search by open + release field

unless @current_release_id = ARGV[0]
  puts "Usage: #{$0} RELEASE_ID"
  puts "Hint: 1.16.0 is 240"
  exit 1
end

# Move bugs with Release set to VERSION to NEXT-VERSION with status new
def gather_issues(offset=0)
  url = "#{URL}/projects/foreman/issues.json?status_id=closed&offset=#{offset}&limit=100&release_id=#{@current_release_id}"
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
puts "Close the release #{URL}/rb/release/#{@current_release_id}/edit - not possible to do through the API"

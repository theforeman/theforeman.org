#!/usr/bin/env ruby
#
# Script to check which plugins have a single author
# Copyright: Red Hat 2017
# LICENSE: GPLv3

require 'json'
require 'rest-client'

def get_gem_names(search)
  page=1
  gems=[]
  url="https://rubygems.org/api/v1/search.json?query=#{search}"

  response = RestClient.get('https://rubygems.org') # test connection and initialize "response"

  $stderr.puts "Searching for gems matching '#{search}'"
  while response.body != "[]"
    $stderr.puts "Page #{page}"
    response = RestClient.get(url+"&page=#{page}")
    JSON.parse(response.body).each do |gem|
      # Strip gems not under our namespace in some way - anything with "theforeman" in the URIs should do
      regex = /(theforeman|katello)/
      next if ( ARGV[0] == "--official" and not gem.select { |k,v| k =~ /uri/}.values.join(" ") =~ regex )
      gems << gem['name']
    end
    page += 1
  end
  gems.sort
end

gems =  get_gem_names('foreman')
gems += get_gem_names('smart_proxy')
gems += get_gem_names('smart-proxy')

gems.sort.each do |gem|
  url = "https://rubygems.org/api/v1/gems/#{gem}/owners.json"
  response = RestClient.get(url)
  json = JSON.parse(response.body)
  if json.size < 2
    puts "#{json.first['handle']} - #{gem}"
  end
end

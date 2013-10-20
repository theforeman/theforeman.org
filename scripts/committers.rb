#!/usr/bin/ruby
require 'tmpdir'
require 'git'

@tagged_repos = %w(foreman smart-proxy foreman-installer foreman-selinux)
@tag_from     = "1.2.0"
@tag_to       = "1.3.0"

@untagged_repos = %w(
  theforeman.org
  puppet-foreman
  puppet-foreman_proxy
  puppet-puppet
  puppet-apache
  puppet-dhcp
  puppet-dns
  puppet-tftp
  kafo
  hammer-cli
  hammer-cli-foreman
  hammer-cli-katello
  hammer-cli-katello-bridge
  community-templates
)
@date_from     = '2013-07-01'
@date_to       = '2013-10-14'

@author_map = {
  "Joseph Magen"   => "Joseph Mitchell Magen",
  "Ivan Necas"     => "Ivan Nečas",
  "Lukas Zapletal" => "Lukáš Zapletal",
  "Marek Hulan"    => "Marek Hulán",
  "mbacovsky"      => "Martin Bačovský",
}

@authors={}

def get_repo_committers repo, tagged = false
  $stderr.puts "Parsing committers for #{repo}"
  raw = []
  g = Git.clone("https://github.com/theforeman/#{repo}", repo)
  g.chdir do
    if tagged
      raw = `git log #{@tag_from}..#{@tag_to} --pretty="%aN" --abbrev-commit`.split("\n").uniq
    else
      raw = `git log --since=#{@date_from} --until=#{@date_to} --pretty="%aN" --abbrev-commit`.split("\n").uniq
    end
  end
  raw.each do |author|
    author = @author_map.keys.include?(author) ? @author_map[author] : author
    @authors.keys.include?(author) ? @authors[author] << repo : @authors[author] = [repo]
    @authors[author].sort!.uniq!
  end
end

Dir.mktmpdir do |dir|
  Dir.chdir dir
  @tagged_repos.each do |repo|
    get_repo_committers(repo,true)
  end
  @untagged_repos.each do |repo|
    get_repo_committers(repo,false)
  end
end

$stderr.puts "---"
if ARGV.delete("--with-repo")
  @authors.sort.map {|a,r| puts "#{a}: #{r.join(',')}" }
else
  puts @authors.keys.sort.join("\n")
end
$stderr.puts "Total committers: #{@authors.keys.size}"

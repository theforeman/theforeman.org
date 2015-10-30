#!/usr/bin/ruby
require 'tmpdir'
require 'git'

@tagged_repos = %w(foreman smart-proxy foreman-installer foreman-selinux)
@tag_from     = "1.9.0"
@tag_to       = "1.10.0-RC2"

@untagged_repos = %w(
  theforeman.org
  puppet-foreman
  puppet-foreman_proxy
  puppet-puppet
  puppet-dhcp
  puppet-dns
  puppet-git
  puppet-tftp
  kafo
  kafo_parsers
  hammer-cli
  hammer-cli-foreman
  community-templates
  chef-handler-foreman
  foreman-bats
  foreman_bootdisk
  foreman_chef
  foreman_discovery
  foreman-docker
  foreman_hooks
  foreman_setup
  foreman_snapshot
  foreman-tasks
  foreman_templates
  ovirt-node-plugin-foreman
  puppetdb_foreman
)
@date_from     = '2015-06-27'
@date_to       = '2015-10-30'

@author_map = {
  "abenari"        => "Amos Benari",
  "Daniel Lobato"  => "Daniel Lobato Garcia",
  "Daniel Lobato García" => "Daniel Lobato Garcia",
  "Joseph Magen"   => "Joseph Mitchell Magen",
  "Ivan Necas"     => "Ivan Nečas",
  "Lukas Zapletal" => "Lukáš Zapletal",
  "Marek Hulan"    => "Marek Hulán",
  "mbacovsky"      => "Martin Bačovský",
  "amirfefer"      => "Amir Fefer",
  "Amir Feferkuchen" => "Amir Fefer",
  "imriz"          => "Imri Zvik",
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

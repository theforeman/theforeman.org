#!/usr/bin/ruby
require 'tmpdir'
require 'git'

MAILMAP = File.join(__dir__, '..', '.mailmap')

@tag_from  = "3.4.0"
@tag_to    = "3.5.0-rc1"
@date_from = nil # derived from the tag
@date_to   = nil # derived from the tag

@tagged_repos = %w(foreman smart-proxy foreman-installer foreman-selinux)

# Sources: https://github.com/theforeman/foreman-installer-modulesync/blob/master/managed_modules.yml
@untagged_repos = %w(
  theforeman.org
  puppet-candlepin
  puppet-certs
  puppet-dhcp
  puppet-dns
  puppet-foreman
  puppet-foreman_proxy
  puppet-foreman_proxy_content
  puppet-git
  puppet-katello
  puppet-katello_devel
  puppet-motd
  puppet-pulpcore
  puppet-puppet
  puppet-puppetserver_foreman
  puppet-qpid
  puppet-tftp
  kafo
  kafo_parsers
  hammer-cli
  hammer-cli-foreman
  foreman_ansible
  foreman_bootdisk
  foreman_discovery
  foreman_hooks
  foreman_openscap
  foreman_setup
  foreman-tasks
  foreman_templates
  puppetdb_foreman
)

@authors={}

def get_repo_committers repo, tagged = false
  $stderr.puts "Parsing committers for #{repo}"
  raw = []
  g = Git.clone("https://github.com/theforeman/#{repo}", repo)
  g.chdir do
    FileUtils.cp(MAILMAP, '.mailmap') unless File.exist?('.mailmap')

    if tagged
      raw = `git log #{@tag_from}..#{@tag_to} --pretty="%aN" --abbrev-commit`.split("\n")

      # Determine from and to date
      @date_from = `git tag -l --format='%(creatordate:short)' #{@tag_from}`.chomp unless @date_from
      @date_to = `git tag -l --format='%(creatordate:short)' #{@tag_to}`.chomp unless @date_to
    else
      raw = `git log --since=#{@date_from} --until=#{@date_to} --pretty="%aN" --abbrev-commit`.split("\n")
    end
  end
  raw.each do |author|
    @authors[author] ||= Hash.new(0)
    @authors[author][repo] += 1
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

with_repo  = ARGV.delete("--with-repo")
with_count =  ARGV.delete("--with-count")
$stderr.puts "---"
if with_repo
  if with_count
    @authors.sort.map do |author,repos|
      puts "#{author}:"
      repos.each do |repo,commits|
        puts "  #{repo}: #{commits}"
      end
    end
  else
    @authors.sort.map {|a,r| puts "#{a}: #{r.keys.join(',')}" }
  end
else
  if with_count
    @authors.sort.map do |author,repos|
      total = repos.values.reduce( :+ )
      puts "#{author}: #{total}"
    end
  else
    puts @authors.keys.sort.join(", ")
  end
end
$stderr.puts "Total committers: #{@authors.size}"

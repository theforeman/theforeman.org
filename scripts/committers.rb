#!/usr/bin/ruby
require 'tmpdir'
require 'git'

@tagged_repos = %w(foreman smart-proxy foreman-installer foreman-selinux)
@tag_from     = "1.16.0"
@tag_to       = "1.17.0-RC1"

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
  foreman_ansible
  foreman-bats
  foreman_bootdisk
  foreman_chef
  foreman_discovery
  foreman-docker
  foreman_hooks
  foreman_openscap
  foreman_setup
  foreman_snapshot
  foreman-tasks
  foreman_templates
  ovirt-node-plugin-foreman
  puppetdb_foreman
)
@date_from     = '2016-09-06'
@date_to       = '2017-09-25'

@author_map = {
  "abenari"        => "Amos Benari",
  "adamruzicka"    => "Adam Ruzicka",
  "Alexander Fisher" => "Alex Fisher",
  "alongoldboim"   => "Alon Goldboim",
  "Daniel Lobato"  => "Daniel Lobato Garcia",
  "Daniel Lobato García" => "Daniel Lobato Garcia",
  "Dirk Goetz"     => "Dirk Götz",
  "Eric D Helms"   => "Eric D. Helms",
  "Joseph Magen"   => "Joseph Mitchell Magen",
  "Ivan Necas"     => "Ivan Nečas",
  "Lukas Zapletal" => "Lukáš Zapletal",
  "Marek Hulan"    => "Marek Hulán",
  "mbacovsky"      => "Martin Bačovský",
  "amirfefer"      => "Amir Fefer",
  "Amir Feferkuchen" => "Amir Fefer",
  "Amir"           => "Amir Fefer",
  "imriz"          => "Imri Zvik",
  "Sean OKeeffe"   => "Sean O'Keeffe",
  "treydock"       => "Trey Dockendorf",
  "orrabin"        => "Ori Rabin",
  "Ondrej Prazak"  => "Ondřej Pražák",
  "lfisher47"      => "Leah Fisher",
  "pkranenburg"    => "Paul Kranenburg",
  "alejandrocfg"   => "Alejandro Falcon",
  "chbaldwi"       => "Chris Baldwin",
  "dhlavac"        => "Dominik Hlavac",
  "kgaikwad"       => "Kavita Gaikwad",
  "lizagilman"     => "Liza Gilman",
  "marten"         => "Marten Veldthuis",
  "matan"          => "Matan Uberstein",
  "matanwerbner"   => "Matan Werbner",
  "oogs"           => "Chris Baldwin",
  "thomasmckay"    => "Thomas McKay",
  "zjhuntin"       => "Zach Huntington-Meath",
}

@authors={}

def get_repo_committers repo, tagged = false
  $stderr.puts "Parsing committers for #{repo}"
  raw = []
  g = Git.clone("https://github.com/theforeman/#{repo}", repo)
  g.chdir do
    if tagged
      raw = `git log #{@tag_from}..#{@tag_to} --pretty="%aN" --abbrev-commit`.split("\n")
    else
      raw = `git log --since=#{@date_from} --until=#{@date_to} --pretty="%aN" --abbrev-commit`.split("\n")
    end
  end
  raw.each do |author|
    author = @author_map.keys.include?(author) ? @author_map[author] : author
    @authors[author] = {} unless @authors.keys.include?(author)
    @authors[author].keys.include?(repo) ? @authors[author][repo] +=1 : @authors[author][repo] = 1
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
$stderr.puts "Total committers: #{@authors.keys.size}"

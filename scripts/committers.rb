#!/usr/bin/ruby
require 'tmpdir'
require 'git'

@tag_from  = "3.4.0"
@tag_to    = "3.5.0-rc1"
@date_from = nil # derived from the tag
@date_to   = nil # derived from the tag

@tagged_repos = %w(foreman smart-proxy foreman-installer foreman-selinux)

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

@author_map = {
  "aabramov"       => "Adi Abramovich",
  "abenari"        => "Amos Benari",
  "adamruzicka"    => "Adam Ruzicka",
  "Alexander Fisher" => "Alex Fisher",
  "alongoldboim"   => "Alon Goldboim",
  "Daniel Lobato"  => "Daniel Lobato Garcia",
  "Daniel Lobato García" => "Daniel Lobato Garcia",
  "Dirk Goetz"     => "Dirk Götz",
  "Eric D Helms"   => "Eric D. Helms",
  "Eric Helms"     => "Eric D. Helms",
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
  "Zjhuntin"       => "Zach Huntington-Meath",
  "Adam Růžička"   => "Adam Ruzicka",
  "Dominik Hlavac Duran" => "Dominik Hlavac",
  "Fabien COMBERNOUS" => "Fabien Combernous",
  "bshuster"       => "Boaz Shuster",
  "jyejare"        => "Jitendra Yejare",
  "ldjebran"       => "Djebran Lezzoum",
  "UXabre"         => "Arend Lapere",
  "ofedoren"       => "Oleh Fedorenko",
  "swadeley"       => "Stephen Wadeley",
  "odovzhenko"     => "Oleg Dovzhenko",
  "Luuk"           => "Luuk Hafkamp",
  "Alexander \"Ananace\" Olofsson" => "Alexander Olofsson",
  "Sebastian Gräßl" =>  "Sebastian Gräßl",
  "boaz1337" => "Boaz Shuster",
  "kamils-iRonin" => "Kamil Szubrycht",
  "laviro" => "Ron Lavi",
  "Ahmet DEMIR" => "Ahmet Demir",
  "arend.lapere@gmail.com" => "Arend Lapere",
  "MariaAga" => "Maria Agaphontzev",
  "Maria" => "Maria Agaphontzev",
  "magaphon" => "Maria Agaphontzev",
  "stefanlasiewski" => "Stephan Lasiewski",
  "dima" => "Dima Berastau",
  "damon" => "Damon Clinkscales",
  "hao-yu" => "Hao Chang Yu",
  "Rohan21Lobo" => "Rohan Arora",
  "amard33p" => "Amardeep Kahali",
  "ianballou" => "Ian Ballou",
  "san7ket" => "Sanket Jagtap",
  "sjha4" => "Samir Jha",
  "yifatmakias" => "Yifat Makias",
  "sthirugn" => "Sureshkumar Thirugnanasambandan",
  "swetha" => "Swetha Seelam Lakshmi Narayanan",
  "jkalchik" => "Jeff Kalchik",
  "fschaer" => "Frederic Schaer",
  "ksagarwal007" => "Kaushik Agarwal",
  "neilfromit" => "Neil Townsend",
  "William Bradford Clark" => "William Clark",
  "calvingsmith" => "Calivn Smith",
  "grizzthedj" => "Chris Smith",
  "tomabg" => "Thomas Pietzka",
  "Emil DRAGU" => "Emil Dragu",
  "vsedmik" => "Vladimir Sedmik",
  "hsahmed" => "Hesham S. Ahmed",
  "Mirek Długosz (Mirosław Długosz-Zalewski)" => "Mirek Długosz",
  "JaskaranNarula" => "Jaskaran Singh Narula",
  "r.stricklin" => "R. Stricklin",
  "brimioulle" => "Fabrice Brimioulle",
  "nofar" => "Nofar Alfassi",
  "nofaralfasi" => "Nofar Alfassi",
  "kmalyjur" => "Karolina Malyjurkova",
  "tux93" => "Marcel Kühlhorn",
  "snemeth" => "Štefan Németh",
  "Stejskal Leos" => "Leos Stejskal",
}

@authors={}

def get_repo_committers repo, tagged = false
  $stderr.puts "Parsing committers for #{repo}"
  raw = []
  g = Git.clone("https://github.com/theforeman/#{repo}", repo)
  g.chdir do
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

task :default => :build

desc 'Clean up generated site'
task :clean do
  sh 'rm -rf _site'
end

desc 'Build site with Jekyll'
task :build do
  sh "jekyll build"
end

desc 'Start server'
task :server do
  sh "jekyll serve --watch --incremental"
end

desc 'Starts up browser window (requires running server)'
task :browser do
  sh "xdg-open http://localhost:4000/index.html"
end

desc "Given a title as an argument, create a new post file"
task :new_post, [:title] do |t, args|
  title = args.title || ENV["title"] || "new-post"
  title_clean = title.downcase.strip.gsub(/\s/, '-').gsub(/[^\w-]/, '')
  filename = "#{Time.now.strftime('%Y-%m-%d')}-#{title_clean}.md"
  path = File.join("_posts", filename)
  if File.exist? path; raise RuntimeError.new("#{path} exists! Refusing to overwrite"); end
  File.open(path, 'w') do |file|
    file.write <<-EOS
---
layout: post
title: #{args.title}
date: #{Time.now.strftime('%Y-%m-%d %k:%M:%S')}
author: Foreman
tags:
- foreman
---

My abstract goes here

<!--more-->

The rest of the post goes here.
EOS
  end
  if editor = ENV["EDITOR"]
    system("#{editor} #{path}")
  else
    puts "#{path} is ready for editing."
  end
end

desc 'Update the foreman-ansible-modules documentation'
task :update_fam_docs, [:fampath] do |t, args|
  fampath = args.fampath || ENV['fampath']
  raise RuntimeError.new("please set the path to foreman-ansible-modules") unless (fampath && File.exist?(fampath))
  sh "pushd #{fampath}/docs && make html && popd"
  sh "rm -rf plugins/foreman-ansible-modules/sphinx/ && cp -a #{fampath}/docs/_build/html/ plugins/foreman-ansible-modules/sphinx"
end

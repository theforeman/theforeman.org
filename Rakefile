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
  sh "jekyll serve --watch"
end

desc 'Starts up browser window (requires running server)'
task :browser do
  sh "xdg-open http://localhost:4000/index.html"
end

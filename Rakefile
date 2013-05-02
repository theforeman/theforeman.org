task :default => :build

desc 'Clean up generated site'
task :clean do
  sh 'rm -rf _site'
end

desc 'Build site with Jekyll'
task :build do
  sh "jekyll"
end

desc 'Start server with --auto'
task :server => :build do
  sh "jekyll --server --auto"
end

desc 'Starts up browser window (requires running server)'
task :browser do
  sh "xdg-open http://localhost:4000/index.html"
end

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'echoe'

require File.dirname(__FILE__) << "/lib/artex/version"

Echoe.new 'artex' do |p|
  p.version = ArTeX::Version::STRING
  p.author = ['Eric Faerber', 'Bruce Williams', 'Wiebe Cazemier', 'Julian Fischer', 'Matthias Folz', 'Robert Gogolok']
  p.email  = 'artex@avarteq.de'
  p.project = 'artex'
  p.summary = "LaTeX preprocessor for PDF generation; Rails plugin"
  p.url = "http://github.com/wgeric/artex"
  p.include_rakefile = true
  p.development_dependencies = %w(echoe flexmock)
  p.development_dependencies << "rails ~>3.2.14"
  p.development_dependencies << "shoulda ~>2.11.3"
  p.rcov_options = '--exclude gems --exclude version.rb --sort coverage --text-summary --html -o coverage'
  p.ignore_pattern = /^(pkg|doc|site)|\.svn|CVS|\.bzr|\.DS|\.git/
  p.retain_gemspec = true
  p.rubygems_version = nil
end

task :coverage do
  system "open coverage/index.html" if PLATFORM['darwin']
end

task default: :test

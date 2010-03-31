require 'rubygems'
require 'echoe'

require File.dirname(__FILE__) << "/lib/artex/version"

Echoe.new 'artex' do |p|
  p.version = ArTeX::Version::STRING
  p.author = ['Bruce Williams', 'Wiebe Cazemier', 'Julian Fischer']
  p.email  = 'artex@avarteq.de'
  p.project = 'artex'
  p.summary = "LaTeX preprocessor for PDF generation; Rails plugin"
  p.url = "http://github.com/avarteq/artex"
  p.include_rakefile = true
  p.development_dependencies = %w(Shoulda echoe)
  p.rcov_options = '--exclude gems --exclude version.rb --sort coverage --text-summary --html -o coverage'
  p.ignore_pattern = /^(pkg|doc|site)|\.svn|CVS|\.bzr|\.DS|\.git/
  p.rubygems_version = nil
end

task :coverage do
  system "open coverage/index.html" if PLATFORM['darwin']
end

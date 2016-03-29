begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'echoe'

Echoe.new 'artex' do
end

task :coverage do
  system "open coverage/index.html" if PLATFORM['darwin']
end

task default: :test

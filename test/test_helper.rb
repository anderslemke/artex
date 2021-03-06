ENV['RAILS_ENV'] ||= 'test'

require 'flexmock/minitest'
require 'minitest/autorun'

require 'minitest/reporters'
Minitest::Reporters.use!

require 'simplecov'

require File.dirname(__FILE__) << '/../lib/artex'

class Minitest::Test

  def change_tmpdir_for_testing
    flexmock(Dir).should_receive(:tmpdir).and_return(File.dirname(__FILE__) << '/tmp')
  end

  def document(name, options = {})
    name = name.is_a?(Symbol) ? "#{name}.tex.erb" : name
    template = File.read(File.dirname(__FILE__) << "/fixtures/#{name}")
    ArTeX::Document.new(template, options)
  end
end

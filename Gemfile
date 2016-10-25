source 'https://rubygems.org'

gemspec

group :development do
  # Byebug is a simple to use, feature rich debugger for Ruby 2
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: :mri, require: false
  # Transpec converts your specs to the latest RSpec syntax with static and dynamic code analysis
  gem 'transpec', require: false
  # Rails Console on the Browser
  gem 'web-console', platforms: :ruby
end

group :development, :lint do
  # Patch-level verification for Bundler
  gem 'bundler-audit', require: false
  # A Ruby static code analyzer. Aims to enforce the community-driven Ruby Style Guide
  gem 'rubocop', require: false
  # RSpec-specific analysis for your projects, as an extension to RuboCop
  gem 'rubocop-rspec', require: false
end

group :development, :test do
  # Provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed
  gem 'bundler'
  # A make-like build utility for Ruby
  gem 'rake', require: false
end

group :test do
  # Collects test coverage data from your Ruby test suite and sends it to Code Climate's hosted, automated code review service.
  # Based on SimpleCov
  gem 'codeclimate-test-reporter', require: false
  # HACK `rake test` doesn't work without it
  # A Rubygems packaging tool that provides Rake tasks for documentation, extension compiling, testing, and deployment
  gem 'echoe', require: false
  # Flexible mocking for Ruby testing
  gem 'flexmock', require: false
  # The instafailing RSpec progress bar formatter
  gem 'fuubar', require: false
  # Create customizable MiniTest output formats
  gem 'minitest-reporters', require: false
  # A RSpec testing framework for Rails
  gem 'rspec-rails', require: false
end

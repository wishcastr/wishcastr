require "codeclimate-test-reporter"
CodeClimate::TestReporter.configure do |config|
  config.logger.level = Logger::WARN
end
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'coveralls'
Coveralls.wear!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
require 'vcr'
require 'webmock/minitest'

Minitest::Reporters.use!
WebMock.disable_net_connect!(allow_localhost: true)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
  config.default_cassette_options = { :record => :once }
end

module SessionsHelper
  def sign_in_as(user)
    post login_path(email: user.email, password: user.password)
  end
end

class ActionDispatch::IntegrationTest
  include SessionsHelper
end

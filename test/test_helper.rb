ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def admin_user
    user = {"username"=>"Dan", "email"=>"dan@dan.com", "hometown"=>"no", "beer"=>"pale ale", "skill"=>"jmontross@empowered.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"} 
    @admin_user = User.new(:admin=>"true")    
    return @admin_user
  end

  # Add more helper methods to be used by all tests here...
end

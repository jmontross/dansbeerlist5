# Load the rails application
require File.expand_path('../application', __FILE__)
config.action_mailer.default_url_options = { :host => 'http://dansbeerlist2.herokuapp.com' }

# Initialize the rails application
Dansbeerlist::Application.initialize!

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
:address => "smtp.sendgrid.net",
:port => 587,
:domain => "sendgrid.net",
:authentication => :plain,
:user_name => ENV["sendgrid_username"],
:password => ENV["sendgrid_password"],
}

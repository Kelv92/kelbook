# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#Settings for heroku sendgrid (To send emails)
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'app27521849@heroku.com',
  :password       => 'arb8zg1m',
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
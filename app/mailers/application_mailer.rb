class ApplicationMailer < ActionMailer::Base
  include SendGrid
  layout 'mailer'
end

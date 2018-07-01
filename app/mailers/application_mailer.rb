class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.env.mailer[:from]
  layout 'mailer'
end

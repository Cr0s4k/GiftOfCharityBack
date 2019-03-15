class ApplicationMailer < ActionMailer::Base
  default from: "admin@#{ENV['BACKEND_HEROKU_APP']}.herokuapp.com"
  layout 'mailer'
end

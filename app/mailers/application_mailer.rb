class ApplicationMailer < ActionMailer::Base
  ADMIN_EMAIL = 'admin@example.com'

  layout 'mailer'
  default from: 'noreply@example.com'
end

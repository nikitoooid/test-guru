class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <hello@testguru.com>}
  layout 'mailer'
end

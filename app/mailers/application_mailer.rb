class ApplicationMailer < ActionMailer::Base
  # AWS SESで検証したドメインのメールアドレス
  default from: "noreply@ramatanky.com"
  layout "mailer"
end

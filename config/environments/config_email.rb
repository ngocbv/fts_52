Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default charset: "utf-8"

  # SMTP settings for gmail
  ActionMailer::Base.smtp_settings = {
    address: "smtp.gmail.com",
    port: "587",
    authentication: :plain,
    user_name: ENV["gmail_username"],
    password: ENV["gmail_password"],
    enable_starttls_auto: true
  }
end

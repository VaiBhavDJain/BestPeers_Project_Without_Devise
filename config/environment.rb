# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
    config.action_mailer.raise_delivery_errors = false
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587, # 8025, 587 and 25 can also be used.
    domain: "yourdomain.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: "vajain@bestpeers.com",
    password: "tnymtamumygrnpdb"
    }
end

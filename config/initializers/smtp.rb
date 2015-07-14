ActionMailer::Base.smtp_settings = {
    enable_starttls_auto: true,
    address:        'smtp.gmail.com',
    port:            587,
    authentication:  :plain,
    domain:          ENV["SMTP_DOMAIN"],
    user_name:       ENV["SMTP_USERNAME"],
    password:        ENV["SMTP_PASSWORD"]
}
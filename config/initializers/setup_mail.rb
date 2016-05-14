ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address                        => 'smtp.sendgrid.net',
    :port                           => '587',
    :authentication                 => :plain,
    :user_name                      => 'app50769101@heroku.com',
    :password                       => 'tzt8oi108131',
    :domain                         => 'heroku.com',
    :enable_starttls_auto           => true
}
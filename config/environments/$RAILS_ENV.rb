config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'https://mighty-gorge-9805.herokuapp.com'
  :user_name            => 'kevin.sihlanick',
  :password             => 'GibsonL-1',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }

  ActionMailer::Base.default_url_options[:host] = "https://mighty-gorge-9805.herokuapp.com"
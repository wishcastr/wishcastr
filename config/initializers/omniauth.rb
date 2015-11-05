Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :amazon, ENV['AMZ_LOGIN_CLIENT_ID'], ENV['AMZ_LOGIN_CLIENT_SECRET'], scope: 'profile'
end

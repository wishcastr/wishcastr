# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :amazon, ENV['AMZ_LOGIN_CLIENT_ID'], ENV['AMZ_LOGIN_CLIENT_SECRET'], {
#     strategy_class: OmniAuth::Strategies::Amazon,
#     provider_ignores_state: true
#   }
# end
# OmniAuth.config.logger = Rails.logger

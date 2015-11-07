# This file is used by Rack-based servers to start the application.
require 'rack/cors'

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

Rack::Cors do
  allow do
    origins /localhost(:\d+)/, 'wishcastr-staging.herokuapp.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

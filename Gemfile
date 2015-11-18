source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', git: "https://github.com/rails/rails"
gem 'sprockets-rails', git: "https://github.com/rails/sprockets-rails"
gem 'sprockets', git: "https://github.com/rails/sprockets"
# gem 'sass-rails', git: "https://github.com/rails/sass-rails"
gem 'arel', git: "https://github.com/rails/arel"
gem 'rack', git: "https://github.com/rack/rack"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use ActiveModelSerializers for 10x faster performance than jbuilder
gem 'active_model_serializers', '~> 0.10.0.rc2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'rails-controller-testing'
gem "codeclimate-test-reporter", group: :test, require: nil

gem 'daemons'
gem 'delayed_job_active_record'
gem 'whenever'


# Should use passenger later.
gem 'puma'

# ya know
gem 'faker'

group :development, :test do
  gem 'pry'
  gem 'sqlite3'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

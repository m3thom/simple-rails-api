source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
#

# Gemfile
gem 'rabl', '~> 0.14.5'
# Also add either `oj` or `yajl-ruby` as the JSON parser
gem 'oj', '~> 3.13.9'

# Authentication gems
gem 'devise', '~> 4.8.0'
gem 'devise-jwt', '~> 0.9.0'
gem 'devise-encryptable', '~> 0.2.0'
gem 'aes', '~> 0.5.1'
# gem 'devise_aes_encryptable'

gem 'dotenv-rails', '~> 2.7.6'

# An HTTP client library that provides a common interface over many adapters
gem 'faraday', '~> 1.8.0'

# gem 'tipi'

# The Best Pagination Ruby Gem
gem 'pagy', '~> 5.6'

gem 'fcm', '~> 1.0.6'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

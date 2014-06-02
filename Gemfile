source 'https://rubygems.org'

ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'mongoid', github: 'mongoid/mongoid' # Use MongoDB

gem "spring", group: :development # Keeps app running in the background

gem 'foundation-rails' # Adds foundation

gem 'redcarpet' # Markdown parser

gem 'minitest-rails' # Adds mini-test framework

gem 'devise' # Adds Devise user authentication
gem 'omniauth' # Adds base omniauth
gem 'omniauth-twitter' # Adds twitter oauth login
gem 'omniauth-facebook' # Adds twitter oauth login
gem 'figaro', '~> 0.7.0'
# gem 'rakismet' # Adds Akismet integration

gem 'pundit' # Adds policy-based authorization support
gem 'coveralls', require: false # Coveralls gem for test coverage

gem 'carrierwave' # Handles file uploads
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mini_magick' # Imagemagick gem
gem 'fog' # Handles Amazon S3 uploads
gem 'sidekiq' # Handles background queue
gem 'whenever', :require => false # CRON JOBS

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do

  gem 'minitest-rails-capybara'
  gem 'turn'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use debugger
# gem 'debugger', group: [:development, :test]

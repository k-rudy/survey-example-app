source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use PostgreSQL as the database for Active Record
gem 'pg'

# Authenication gem
gem "sorcery"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Twitter's toolkit for kickstarting your site or app's CSS
gem 'less-rails-bootstrap'

# Helps to avoid using inline styles in the email templates
gem 'roadie'

# Sending emails gem
gem 'mailhopper'
gem 'delayed_mailhopper'

# Asynchronous job processing
gem 'delayed_job_active_record'

# Postgre full-text search
gem 'textacular'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  # Easy email opening in a browser window
  gem 'letter_opener'
  
  # Required for twitter-bootstrap-rails
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby

  # Debugging lib
  gem 'pry'
end

group :test do
  # Test coverage measurement
  gem 'simplecov', require: false

  # Testing framework
  gem 'rspec-rails', '~> 2.0'

  # Test factories lib
  gem 'factory_girl'
  
  # Simplifies testing common rails functionality like entity relations and validations
  gem "shoulda-matchers"
end

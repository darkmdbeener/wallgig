source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use pg as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use puma as the app server
gem 'puma'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 3.0.0'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-rbenv'
  gem 'capistrano-puma', github: 'seuros/capistrano-puma'
end

# Use Foreman to manage the app
gem 'foreman'

# Use debugger
# gem 'debugger', group: [:development, :test]

# development and test
group :development, :test do
  # specs
  gem 'rspec-rails'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'ffaker'
  gem 'coveralls', require: false

  # utilities
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'database_cleaner'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-sidekiq'
  gem 'guard-spork'
  gem 'rb-inotify'
  gem 'spork-rails'
end

# auth
gem 'devise'
gem 'cancan', github: 'mindvision/cancan'
gem 'omniauth'
gem 'omniauth-facebook'

# admin
gem 'activeadmin', github: 'gregbell/active_admin'

# models
gem 'friendly_id', '~> 5.0.0'
gem 'workflow', github: 'geekq/workflow'
gem 'dragonfly', '~> 1.0.0'
gem 'country_select'
gem 'enumerize'
gem 'kaminari'
gem 'kaminari-bootstrap', '~> 3.0.1'
gem 'impressionist'
gem 'paper_trail', '~> 3.0.0'
gem 'ancestry'
gem 'acts_as_list'
gem 'acts_as_commentable'
gem 'acts_as_votable', '~> 0.8.0'

# views
gem 'slim'
gem 'haml-rails'
gem 'simple_form'
gem 'eco'

# assets
gem 'bootstrap-sass', '~> 3.1.0'
gem 'bourbon'

# services
gem 'newrelic_rpm'
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'doorkeeper', '~> 0.7.0'
gem 'tire'
gem 'pg_search'

gem 'sidekiq', github: 'mperham/sidekiq'
gem 'sidetiq', github: 'tobiassvn/sidetiq'

gem 'redis-rails'
gem 'redis-objects'

# utilities
gem 'dotenv-rails'
gem 'pry-rails'
gem 'miro'
gem 'color'
gem 'colorscore'
gem 'httparty'
gem 'active_link_to'
gem 'meta-tags', :require => 'meta_tags'
# gem 'phashion'
gem 'draper', github: 'jianyuan/draper'
gem 'redcarpet'

# rack
gem 'rack-cache', require: 'rack/cache', group: :production
gem 'rack-mini-profiler'

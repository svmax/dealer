source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.8'

gem 'mongoid', '7.0.13'
gem 'rails', '6.1.4'
gem 'puma', '5.0'
gem 'sidekiq', '6.2.1'
gem 'sidekiq-scheduler', '3.1.0'
gem 'active_interaction', '4.0.4'
gem 'rack-cors', '1.0'

gem 'bootsnap', '1.7.5', require: false

group :development, :test do
  gem 'dotenv-rails', '2.7.6'
  gem 'pry'
end

group :development do
  gem 'rubocop', '~> 0.82'
  gem 'rubocop-performance', '~> 1.5', require: false
  gem 'rubocop-rails', '~> 2.5', require: false

  gem 'listen', '3.3'
  gem 'spring'
end

group :test do
  gem 'factory_bot_rails'
  gem 'mongoid-rspec'
  gem 'rspec-rails'
  gem 'webmock'
  gem 'rspec'
  gem 'faker'
  gem 'vcr'
end
ruby "2.4.1"
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'cancancan'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'carrierwave-base64'
gem 'fog-aws'
gem 'rmagick'
gem 'pg'
gem 'devise_token_auth'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'rack-cors'
gem 'acts_as_list'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'aasm'
gem 'dotenv-rails'
gem 'active_model_serializers'
gem 'apipie-rails'
gem 'rails_12factor'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'ffaker'
  gem 'shoulda-matchers'
  gem 'json_matchers'
  gem 'rspec-json_expectations'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

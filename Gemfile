source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'rails', '~> 5.2.2'
gem 'pg'
gem 'puma', '~> 3.11'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'dry-struct'
gem 'dry-types'
gem 'dry-validation'
gem 'dry-monads'
gem 'dry-auto_inject'
gem 'httparty'

group :development, :test do
  gem 'pry-rails'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"

gem "rails", "~> 7.0.4"

gem "devise"
gem "mail", "~> 2.7.1", require: false

gem "sprockets-rails"

gem 'jquery-rails'
gem 'rails-ujs'
gem 'turbolinks'

gem "shrine", "~> 3.3"
gem "image_processing", "~> 1.12", ">= 1.12.1"

gem 'followability'

gem "pg", "~> 1.1"

gem "tailwindcss-rails", "~> 2.0"
gem 'foreman', '~> 0.87.2'

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "letter_opener"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'rspec-rails', '~> 6.0.0'
end



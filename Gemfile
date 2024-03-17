source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem 'sidekiq'
gem "rails", "~> 7.0.8"
gem "interactor"
gem 'activerecord-import'
gem "inline_svg", "~> 1.9"
gem "rolify"
gem "discard"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "seedbank"
gem "dotenv"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "action_policy"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "pg"
gem "redis", "~> 4.0"
gem "slim-rails"
gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem "draper", "~> 4.0"

# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.4"

gem "bootsnap", ">= 1.4.2", require: false
gem "bootstrap-sass", "~> 3.4.1"
gem "jbuilder", "~> 2.7"
gem "jquery-rails"
gem "octokit", "~> 4.0"
gem "pagy", "~> 3.5"
gem "puma", "~> 4.3"
gem "rails", "~> 6.0.2", ">= 6.0.2.1"
gem "sass-rails", ">= 3.2"
gem "sprockets-rails", require: "sprockets/railtie"

group :development, :test do
  gem "pry", "~> 0.12.2"
  gem "rails-controller-testing"
  gem "rspec-rails", "4.0.0.beta3"
  gem "rubocop-rails"
end

group :development do
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

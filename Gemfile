# frozen_string_literal: true

source "https://rubygems.org"

gemspec
rails_version = (ENV["RAILS_VERSION"] || "6.0.3.2").to_s

gem "rake", "~> 12.0"
gem "rails", rails_version == "master" ? {github: "rails/rails"} : rails_version
gem "puma", "~> 4.1"
gem "webpacker", "~> 5.0"
gem "bootsnap", ">= 1.4.2", require: false
gem "view_component_storybook", "~> 0.4.0"

group :development, :test do
  gem "minitest", "~> 5.0"
  gem "pry-rails"
end

group :development do
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", "~> 3"
end

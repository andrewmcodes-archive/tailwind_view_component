# frozen_string_literal: true

require "bundler/setup"
require "pry"
require "simplecov"
# require "simplecov-console"

SimpleCov.start do
  command_name "rails#{ENV["RAILS_VERSION"]}-ruby#{ENV["RUBY_VERSION"]}" if ENV["RUBY_VERSION"]
  add_filter "/demo/"
  add_filter "/test/"
  # formatter SimpleCov::Formatter::Console
end

ENV["RAILS_ENV"] = "test"

require File.expand_path("../../demo/config/environment.rb", __FILE__)
require "rails/test_help"
require "view_component/test_helpers"
require "test_helpers/component_test_helpers"

require "minitest/autorun"
require "tailwind/view_components"

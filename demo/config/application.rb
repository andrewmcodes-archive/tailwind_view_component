# frozen_string_literal: true

require_relative "boot"

require "action_controller/railtie"
require "action_view/railtie"
require "active_model/railtie"
require "rails/test_unit/railtie"
require "view_component/engine"
require "view_component/storybook/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.view_component_storybook.show_stories = true
    config.action_dispatch.default_headers.clear
    config.allowed_cors_origins = "http://localhost:5000"
    config.action_dispatch.default_headers = {
      "Access-Control-Allow-Origin" => "*",
      "Access-Control-Request-Method" => %w[GET PUT POST].join(",")
    }
  end
end

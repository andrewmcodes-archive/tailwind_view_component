# frozen_string_literal: true

require "active_support/core_ext"

# ViewComponent

require "view_component/engine"

# Helpers

require "tailwind/class_name_helper"
require "tailwind/classify"
require "tailwind/fetch_or_fallback_helper"

# Base configurations

require_relative "component"
require_relative "base_component"
require_relative "slot"

# Components

require_relative "box_component"

# frozen_string_literal: true

require "active_support/core_ext"

# ViewComponent

require "view_component/engine"

# Octicons

require "octicons_helper/helper"

# Helpers

require "tailwind/class_name_helper"
require "tailwind/classify"
require "tailwind/fetch_or_fallback_helper"

# Base configurations

require_relative "component"
require_relative "base_component"
require_relative "slot"

# Components

require_relative "avatar_component"
require_relative "border_box_component"
require_relative "box_component"
require_relative "breadcrumb_component"
require_relative "button_component"
require_relative "details_component"
require_relative "dropdown_menu_component"
require_relative "flex_component"
require_relative "flex_item_component"
require_relative "heading_component"
require_relative "label_component"
require_relative "link_component"
require_relative "subhead_component"
require_relative "text_component"

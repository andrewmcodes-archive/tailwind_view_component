# frozen_string_literal: true

require "test_helper"

class TailwindDropdownMenuComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_dropdown_component_renders_dark_scheme
    render_inline(Tailwind::DropdownMenuComponent.new(scheme: :dark)) { "Body" }

    assert_selector("details-menu.dropdown-menu.dropdown-menu-dark")
  end

  def test_dropdown_direction_renders
    render_inline(Tailwind::DropdownMenuComponent.new(direction: :w)) { "Body" }

    assert_selector("details-menu.dropdown-menu.dropdown-menu-w")
  end

  def test_falls_back_to_defaults_when_invalid_options_are_passed
    without_fetch_or_fallback_raises do
      render_inline(Tailwind::DropdownMenuComponent.new(direction: :circle, scheme: :orange)) { "Body" }
    end

    assert_selector("details-menu.dropdown-menu")
  end

  def test_dropdown_header_renders
    render_inline(Tailwind::DropdownMenuComponent.new(header: "Header")) { "Body" }

    assert_selector(".dropdown-header")
  end
end

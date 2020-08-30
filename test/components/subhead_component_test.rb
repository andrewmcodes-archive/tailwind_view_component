# frozen_string_literal: true

require "test_helper"

class SubheadComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_does_not_render_without_heading
    render_inline(Tailwind::SubheadComponent.new)

    refute_component_rendered
  end

  def test_renders_heading
    render_inline(Tailwind::SubheadComponent.new) do |component|
      component.slot(:heading, tag: :h2) { "Hello World" }
    end

    assert_selector(".Subhead h2.Subhead-heading", text: "Hello World")
  end

  def test_render_dangerous_heading
    render_inline(Tailwind::SubheadComponent.new) do |component|
      component.slot(:heading, danger: true) { "Hello World" }
    end

    assert_selector(".Subhead .Subhead-heading--danger", text: "Hello World")
  end

  def test_render_without_border
    render_inline(Tailwind::SubheadComponent.new(hide_border: true)) do |component|
      component.slot(:heading) { "Hello World" }
    end

    assert_selector(".Subhead.border-bottom-0.mb-0", text: "Hello World")
  end

  def test_bottom_margin_can_be_overridden_when_border_is_hidden
    render_inline(Tailwind::SubheadComponent.new(hide_border: true, mb: 1)) do |component|
      component.slot(:heading) { "Hello World" }
    end

    assert_selector(".Subhead.border-bottom-0.mb-1", text: "Hello World")
  end

  def test_renders_actions
    render_inline(Tailwind::SubheadComponent.new(heading: "Hello world")) do |component|
      component.slot(:heading) { "Hello World" }
      component.slot(:actions) { "My Actions" }
    end

    assert_selector(".Subhead .Subhead-actions", text: "My Actions")
  end

  def test_handles_spacious
    render_inline(Tailwind::SubheadComponent.new(spacious: true)) do |component|
      component.slot(:heading) { "Hello World" }
    end

    assert_selector(".Subhead.Subhead--spacious .Subhead-heading", text: "Hello World")
  end

  def test_renders_a_description
    render_inline(Tailwind::SubheadComponent.new(heading: "Hello world")) do |component|
      component.slot(:heading) { "Hello World" }
      component.slot(:description) { "My Description" }
    end

    assert_selector(".Subhead .Subhead-description", text: "My Description")
  end
end

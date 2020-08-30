# frozen_string_literal: true

require "test_helper"

class TailwindFlexComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_renders_content
    render_inline(Tailwind::FlexComponent.new) { "content" }

    assert_text("content")
  end

  def test_renders_as_d_flex
    render_inline(Tailwind::FlexComponent.new) { "content" }

    assert_selector(".flex")
  end

  def test_inline_defaults_to_false
    without_fetch_or_fallback_raises do
      render_inline(Tailwind::FlexComponent.new(inline: :grande)) { "content" }
    end

    assert_selector(".flex")
  end

  def test_flex_wrap_defaults_to_nil
    without_fetch_or_fallback_raises do
      render_inline(Tailwind::FlexComponent.new(flex_wrap: :grande)) { "content" }
    end

    refute_selector(".flex-wrap")
    refute_selector(".flex-no-wrap")
  end

  def test_renders_flex_wrap_true
    render_inline(Tailwind::FlexComponent.new(flex_wrap: true)) { "content" }

    assert_selector(".flex-wrap")
  end

  def test_renders_flex_wrap_false
    render_inline(Tailwind::FlexComponent.new(flex_wrap: false)) { "content" }

    assert_selector(".flex-no-wrap")
  end

  def test_renders_flex_wrap_nil
    render_inline(Tailwind::FlexComponent.new(flex_wrap: nil)) { "content" }

    refute_selector(".flex-wrap")
    refute_selector(".flex-no-wrap")
  end

  def test_renders_align_items_center
    render_inline(Tailwind::FlexComponent.new(align_items: :center)) { "content" }

    assert_selector(".items-center")
  end

  def test_align_items_falls_back_to_nil
    without_fetch_or_fallback_raises do
      render_inline(Tailwind::FlexComponent.new(align_items: :foo)) { "content" }
    end

    refute_selector(".items-center")
  end

  def test_renders_as_d_inline_flex
    render_inline(Tailwind::FlexComponent.new(inline: true)) { "content" }

    assert_selector(".inline-flex")
  end

  def test_justify_content_falls_back_to_nil
    without_fetch_or_fallback_raises do
      render_inline(Tailwind::FlexComponent.new(justify_content: :grande)) { "content" }
    end

    refute_selector(".justify-start")
  end

  def test_renders_justify_content
    render_inline(Tailwind::FlexComponent.new(justify_content: :center)) { "content" }

    assert_selector(".justify-center")
  end

  def test_does_not_render_justify_content_if_nil
    render_inline(Tailwind::FlexComponent.new(justify_content: nil)) { "content" }

    refute_selector(".justify-start")
  end

  def test_renders_direction
    render_inline(Tailwind::FlexComponent.new(direction: :row)) { "content" }

    assert_selector(".flex-row")
  end

  def test_does_not_render_direction_if_nil
    render_inline(Tailwind::FlexComponent.new(direction: nil)) { "content" }

    refute_selector(".flex-row")
  end

  def test_renders_responsive_direction
    render_inline(Tailwind::FlexComponent.new(direction: [:row, :col])) { "content" }

    assert_selector(".flex-row")
    assert_includes(rendered_component, "sm:flex-col")
  end
end

# frozen_string_literal: true

require "test_helper"

class TailwindFlexItemComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_renders_content
    render_inline(Tailwind::FlexItemComponent.new) { "content" }

    assert_text("content")
  end

  def test_renders_flex_auto_class
    render_inline(Tailwind::FlexItemComponent.new(flex_auto: true)) { "content" }

    assert_selector(".flex-auto")
  end

  def test_flex_auto_falls_back_to_false
    without_fetch_or_fallback_raises do
      render_inline(Tailwind::FlexItemComponent.new(flex_auto: :grande)) { "content" }
    end

    refute_selector(".flex-auto")
  end
end

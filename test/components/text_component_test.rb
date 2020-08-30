# frozen_string_literal: true

require "test_helper"

class TailwindTextComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_renders_content
    render_inline(Tailwind::TextComponent.new) { "content" }

    assert_text("content")
  end

  def test_renders_span
    render_inline(Tailwind::TextComponent.new) { "content" }

    assert_selector("span")
  end

  def test_renders_as_p
    render_inline(Tailwind::TextComponent.new(tag: :p)) { "content" }

    assert_selector("p")
  end
end

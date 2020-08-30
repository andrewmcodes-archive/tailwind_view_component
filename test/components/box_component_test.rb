# frozen_string_literal: true

require "test_helper"

class TailwindBoxComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_renders_content
    render_inline(Tailwind::BoxComponent.new) do
      "content"
    end

    assert_text("content")
  end

  def test_renders_div
    render_inline(Tailwind::BoxComponent.new) do
      "content"
    end

    assert_selector("div")
  end
end

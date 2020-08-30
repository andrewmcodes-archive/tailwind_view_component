# frozen_string_literal: true

require "test_helper"

class TailwindLinkComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_renders_content_and_not_muted_link
    render_inline(Tailwind::LinkComponent.new(href: "http://joe-jonas-shirtless.com")) { "content" }

    assert_text("content")
    refute_selector(".muted-link")
  end

  def test_renders_as_a_link
    render_inline(Tailwind::LinkComponent.new(href: "http://google.com")) { "content" }

    assert_selector("a[href='http://google.com']")
  end

  def test_renders_tailwind_classes
    render_inline(Tailwind::LinkComponent.new(href: "http://google.com", mr: 3, muted: true)) { "content" }

    assert_selector(".mr-3.muted-link")
  end

  def test_defaults_muted_to_false
    without_fetch_or_fallback_raises do
      render_inline(Tailwind::LinkComponent.new(href: "http://google.com", muted: nil)) { "content" }
    end

    refute_selector(".muted-link")
  end

  def test_renders_muted_and_custom_css_class
    render_inline(Tailwind::LinkComponent.new(href: "http://google.com", classes: "foo", muted: true)) { "content" }

    assert_selector(".foo.muted-link")
  end
end

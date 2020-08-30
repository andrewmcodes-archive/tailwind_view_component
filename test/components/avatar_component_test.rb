# frozen_string_literal: true

require "test_helper"

class TailwindAvatarComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_renders_an_avatar
    render_inline(Tailwind::AvatarComponent.new(src: "https://github.com/github.png", alt: "github"))

    assert_selector("img.inline-flex.items-center.justify-center")
  end

  def test_defaults_to_size_20
    render_inline(Tailwind::AvatarComponent.new(src: "https://github.com/github.png", alt: "github"))

    assert_selector("img.inline-flex.items-center.justify-center[size=20][height=20][width=20]")
  end

  def test_defaults_to_circle_avatar
    render_inline(Tailwind::AvatarComponent.new(src: "https://github.com/github.png", alt: "github"))

    assert_selector("img.inline-flex.items-center.justify-center.rounded-full")
  end

  def test_sets_size_height_and_width
    render_inline(Tailwind::AvatarComponent.new(src: "https://github.com/github.png", alt: "github", size: 50))

    assert_selector("img.inline-flex.items-center.justify-center[size=50][height=50][width=50]")
  end

  def test_squared_avatar
    render_inline(Tailwind::AvatarComponent.new(src: "https://github.com/github.png", alt: "github", square: true))

    assert_selector("img.inline-flex.items-center.justify-center")
    refute_selector(".rounded-full")
  end
end

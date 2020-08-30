# frozen_string_literal: true

require "test_helper"

class TailwindBaseComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_renders_title
    render_inline(Tailwind::BaseComponent.new(tag: :div, title: "title"))

    assert_selector("[title='title']")
  end

  def test_renders_content
    render_inline(Tailwind::BaseComponent.new(tag: :div)) do
      "content"
    end

    assert_text("content")
  end

  def test_skips_rendering_tailwind_class_if_value_is_nil
    result = render_inline(Tailwind::BaseComponent.new(tag: :div, my: nil)) # rubocop:todo ViewComponent/RenderInlineAssignment

    assert result.css("div").first.attribute("class").nil?
  end

  def test_renders_arbitrary_attributes
    render_inline(Tailwind::BaseComponent.new(tag: :div, itemtype: "http://schema.org/Code"))

    assert_selector("[itemtype='http://schema.org/Code']")
  end

  def test_renders_arbitrary_class_names
    render_inline(Tailwind::BaseComponent.new(tag: :div, classes: "foobar"))

    assert_selector(".foobar")
  end

  def test_renders_arbitrary_blank_attributes
    render_inline(Tailwind::BaseComponent.new(tag: :div, itemscope: true))

    assert_selector("[itemscope]")
  end

  def test_conditionally_renders_arbitrary_blank_attributes
    render_inline(Tailwind::BaseComponent.new(tag: :div, itemscope: false))

    refute_selector("[itemscope]")
  end

  def test_does_not_render_class_attribute_if_none_is_set
    render_inline(Tailwind::BaseComponent.new(tag: :div, title: "title"))

    refute_selector("div[class='']")
  end

  def test_does_not_render_tailwind_layout_classes_as_attributes
    render_inline(Tailwind::BaseComponent.new(tag: :div, my: 4))

    refute_selector("[my='4']")
  end

  def test_renders_as_a_link
    render_inline(Tailwind::BaseComponent.new(tag: :a, href: "http://google.com"))

    assert_selector("a[href='http://google.com']")
  end

  # We were calling tag.send(as), passing in :p ended up calling `p`, aka `puts`
  # Due to how Rails uses method_missing in TagHelper. See Slack convo:
  # https://github.slack.com/archives/C0HV3F37A/p1556216733019500
  def test_renders_as_a_paragraph
    render_inline(Tailwind::BaseComponent.new(tag: :p))

    refute_text("[")
  end

  def test_renders_data_attributes
    render_inline(Tailwind::BaseComponent.new(tag: :div, data: {foo: "bar"}))

    assert_selector("[data-foo='bar']")
  end

  def test_renders_test_selector
    render_inline(Tailwind::BaseComponent.new(tag: :div, test_selector: "bar"))

    refute_selector("[test_selector='bar']")
    assert_selector("[data-test-selector='bar']")
  end

  def test_renders_height_attribute
    render_inline(Tailwind::BaseComponent.new(tag: :div, height: 30))

    assert_selector("div[height=30]")
  end

  def test_renders_width_attribute
    render_inline(Tailwind::BaseComponent.new(tag: :div, width: 30))

    assert_selector("div[width=30]")
  end

  def test_does_not_render_height_as_attribute_if_value_is_class
    render_inline(Tailwind::BaseComponent.new(tag: :div, height: :fill))

    refute_selector("div[height='fill']")
    assert_selector("div.height-fill")
  end

  def test_does_not_render_width_as_attribute_if_value_is_class
    render_inline(Tailwind::BaseComponent.new(tag: :div, width: :fill))

    refute_selector("div[width='fill']")
    assert_selector("div.width-fill")
  end
end

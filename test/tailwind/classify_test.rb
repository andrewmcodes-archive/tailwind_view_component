# frozen_string_literal: true

require "test_helper"

class TailwindClassifyTest < Minitest::Test
  def test_multiple_params
    assert_generated_class("m-4 py-2", {m: 4, py: 2})
  end

  def test_font_size
    assert_generated_class("text-xs", {font_size: "xs"})
    assert_generated_class("text-sm", {font_size: "sm"})
    assert_generated_class("text-base", {font_size: "base"})
    assert_generated_class("text-lg", {font_size: "lg"})
    assert_generated_class("text-xl", {font_size: "xl"})
    assert_generated_class("text-2xl", {font_size: "2xl"})
    assert_generated_class("text-3xl", {font_size: "3xl"})
    assert_generated_class("text-4xl", {font_size: "4xl"})
    assert_generated_class("text-5xl", {font_size: "5xl"})
    assert_generated_class("text-6xl", {font_size: "6xl"})
  end

  def test_m
    assert_generated_class("m-4", {m: 4})
    assert_generated_class("mx-4", {mx: 4})
    assert_generated_class("my-4", {my: 4})
    assert_generated_class("mt-4", {mt: 4})
    assert_generated_class("ml-4", {ml: 4})
    assert_generated_class("mb-4", {mb: 4})
    assert_generated_class("mr-4", {mr: 4})
    assert_generated_class("-mt-4", {mt: -4})
    assert_generated_class("-ml-4", {ml: -4})
    assert_generated_class("-mb-4", {mb: -4})
    assert_generated_class("-mr-4", {mr: -4})
    assert_generated_class("mx-auto", {mx: :auto})

    assert_raises ArgumentError do
      Tailwind::Classify.call(m: -420)
    end

    assert_raises ArgumentError do
      Tailwind::Classify.call(m: 420)
    end

    assert_raises ArgumentError do
      Tailwind::Classify.call(mr: -420)
    end
  end

  def test_p
    assert_generated_class("p-4", {p: 4})
    assert_generated_class("px-4", {px: 4})
    assert_generated_class("py-4", {py: 4})
    assert_generated_class("pt-4", {pt: 4})
    assert_generated_class("pl-4", {pl: 4})
    assert_generated_class("pb-4", {pb: 4})
    assert_generated_class("pr-4", {pr: 4})

    assert_raises ArgumentError do
      Tailwind::Classify.call(p: -420)
    end

    assert_raises ArgumentError do
      Tailwind::Classify.call(p: 420)
    end
  end

  def test_position
    assert_generated_class("relative", {position: :relative})
    assert_generated_class("absolute", {position: :absolute})
    assert_generated_class("fixed", {position: :fixed})
    assert_generated_class("top-0", {top: false})
    assert_generated_class("bottom-0", {bottom: false})
    assert_generated_class("left-0", {left: false})
    assert_generated_class("right-0", {right: false})

    refute_generated_class({top: true})
    refute_generated_class({bottom: true})
    refute_generated_class({left: true})
    refute_generated_class({right: true})
  end

  def test_display
    assert_generated_class("block", {display: :block})
    assert_generated_class("none", {display: :none})
    assert_generated_class("inline", {display: :inline})
    assert_generated_class("inline-block", {display: :inline_block})
    assert_generated_class("table", {display: :table})
    assert_generated_class("table-cell", {display: :table_cell})
  end

  def test_visible
    assert_generated_class("visible", {visible: true})
    assert_generated_class("invisible", {visible: false})
  end

  # def test_hide
  #   assert_generated_class("hide-sm", {hide: :sm})
  #   assert_generated_class("hide-md", {hide: :md})
  #   assert_generated_class("hide-lg", {hide: :lg})
  #   assert_generated_class("hide-xl", {hide: :xl})
  # end

  def test_vertical_align
    assert_generated_class("align-baseline", {vertical_align: :baseline})
    assert_generated_class("align-top", {vertical_align: :top})
    assert_generated_class("align-middle", {vertical_align: :middle})
    assert_generated_class("align-bottom", {vertical_align: :bottom})
    assert_generated_class("align-text-top", {vertical_align: :text_top})
    assert_generated_class("align-text-bottom", {vertical_align: :text_bottom})
  end

  def test_float
    assert_generated_class("float-left", {float: :left})
  end

  def test_underline
    assert_generated_class("no-underline", {underline: false})
    assert_generated_class("underline", {underline: true})
  end

  def test_color
    assert_generated_class("text-transparent", {color: :transparent})
    assert_generated_class("text-current", {color: :current})
    assert_generated_class("text-black", {color: :black})
    assert_generated_class("text-white", {color: :white})
    assert_generated_class("text-gray-500", {color: :gray_500})
  end

  def test_bg
    assert_generated_class("bg-blue-500", {bg: :blue_500})
    assert_generated_class("bg-gray-900", {bg: :gray_900})
    assert_generated_class("bg-purple-300", {bg: :purple_300})
  end

  def test_text_align
    assert_generated_class("text-right", {text_align: :right})
    assert_generated_class("text-left", {text_align: :left})
  end

  def test_font_weight
    assert_generated_class("font-hairline", {font_weight: :hairline})
    assert_generated_class("font-thin", {font_weight: :thin})
    assert_generated_class("font-light", {font_weight: :light})
    assert_generated_class("font-normal", {font_weight: :normal})
    assert_generated_class("font-medium", {font_weight: :medium})
    assert_generated_class("font-semibold", {font_weight: :semibold})
    assert_generated_class("font-bold", {font_weight: :bold})
    assert_generated_class("font-extrabold", {font_weight: :extrabold})
    assert_generated_class("font-black", {font_weight: :black})
  end

  def test_box_shadow
    assert_generated_class("shadow", {shadow: true})
    assert_generated_class("shadow-xs", {shadow: :xs})
    assert_generated_class("shadow-sm", {shadow: :sm})
    assert_generated_class("shadow-md", {shadow: :md})
    assert_generated_class("shadow-lg", {shadow: :lg})
    assert_generated_class("shadow-xl", {shadow: :xl})
    assert_generated_class("shadow-2xl", {shadow: "2xl"})
    assert_generated_class("shadow-inner", {shadow: :inner})
    assert_generated_class("shadow-outline", {shadow: :outline})
    assert_generated_class("shadow-none", {shadow: :none})
  end

  def test_border
    assert_generated_class("border-l", {border: :l})
    assert_generated_class("border-t", {border: :t})
    assert_generated_class("border-b", {border: :b})
    assert_generated_class("border-r", {border: :r})
  end

  def test_border_color
    assert_generated_class("border-gray-500", {border_color: :gray_500})
  end

  def test_justify_content
    assert_generated_class("justify-start", {justify_content: :start})
    assert_generated_class("justify-end", {justify_content: :end})
    assert_generated_class("justify-center", {justify_content: :center})
    assert_generated_class("justify-between", {justify_content: :between})
    assert_generated_class("justify-around", {justify_content: :around})
  end

  def test_align_items
    assert_generated_class("items-start", {align_items: :start})
    assert_generated_class("items-end", {align_items: :end})
    assert_generated_class("items-center", {align_items: :center})
    assert_generated_class("items-baseline", {align_items: :baseline})
    assert_generated_class("items-stretch", {align_items: :stretch})
  end

  def test_word_break
    assert_generated_class("break-all", {word_break: :all})
  end

  def test_responsive
    assert_generated_class("p-4", {p: [4]})
    assert_generated_class("p-4 sm:p-3", {p: [4, 3]})
    assert_generated_class("float-left md:float-right", {float: [:left, nil, :right]})
    assert_generated_class("flex sm:block", {display: [:flex, :block]})
    assert_generated_class("flex md:block", {display: [:flex, nil, :block]})
    assert_generated_class("lg:block", {display: [nil, nil, nil, :block]})
    assert_generated_class("xl:block", {display: [nil, nil, nil, nil, :block]})
    assert_generated_class("flex-row sm:flex-col", {direction: [:row, :col]})
    assert_generated_class("p-4 sm:p-3 md:p-3 lg:p-3 xl:p-6", {p: [4, 3, 3, 3, 6]})

    assert_raises ArgumentError do
      Tailwind::Classify.call(border: [:top, :left])
    end
  end

  def test_style
    assert_equal("background-color: #fff;", Tailwind::Classify.call(bg: "#fff")[:style])
  end

  def test_height
    assert_equal(10, Tailwind::Classify.call(height: 10)[:height])
    assert_nil(Tailwind::Classify.call(height: :fit)[:height])
    assert_nil(Tailwind::Classify.call(height: :fill)[:height])
  end

  def test_width
    assert_equal(10, Tailwind::Classify.call(width: 10)[:width])
    assert_nil(Tailwind::Classify.call(width: :fit)[:width])
    assert_nil(Tailwind::Classify.call(width: :fill)[:width])
  end

  def test_flex
    assert_generated_class("flex-1", {flex: 1})
    assert_generated_class("flex-auto", {flex: :auto})
  end

  def test_flex_align_self
    assert_generated_class("self-auto", {align_self: :auto})
    assert_generated_class("self-start", {align_self: :start})
    assert_generated_class("self-end", {align_self: :end})
    assert_generated_class("self-center", {align_self: :center})
    assert_generated_class("self-stretch", {align_self: :stretch})
  end

  def test_width_and_height
    assert_generated_class("width-fit", {width: :fit})
    assert_generated_class("width-fill", {width: :fill})
    assert_generated_class("height-fit", {height: :fit})
    assert_generated_class("height-fill", {height: :fill})
  end

  def test_flex_grow
    assert_generated_class("flex-grow-0", {flex_grow: 0})
    assert_generated_class("flex-grow", {flex_grow: 1})
  end

  def test_flex_shrink
    assert_generated_class("flex-shrink-0", {flex_shrink: 0})
    assert_generated_class("flex-shrink", {flex_shrink: 1})
  end

  def test_raises_error_when_passing_in_a_tailwind_css_class_name_in_development
    ENV["RAILS_ENV"] = "development"
    exception = assert_raises ArgumentError do
      Tailwind::Classify.call(classes: "bg-blue-500 text-center float-left ml-1")
    end

    assert_includes exception.message, "Tailwind CSS class names"
  ensure
    ENV["RAILS_ENV"] = "test"
  end

  def test_does_not_raise_error_when_passing_in_a_tailwind_css_class_otherwise
    assert_generated_class("bg-blue-500 text-center float-left ml-1 ", {classes: "bg-blue-500 text-center float-left ml-1"})
  end

  def assert_generated_class(generated_class_name, input)
    assert_equal(generated_class_name, Tailwind::Classify.call(**input)[:class])
  end

  def refute_generated_class(input)
    assert_nil(Tailwind::Classify.call(**input)[:class])
  end
end

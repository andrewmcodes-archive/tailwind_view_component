# frozen_string_literal: true

module Tailwind
  class FlexComponent < Tailwind::Component
    JUSTIFY_CONTENT_DEFAULT = nil
    JUSTIFY_CONTENT_MAPPINGS = {
      start: "justify-start",
      end: "justify-end",
      center: "justify-center",
      between: "justify-between",
      around: "justify-around",
      evenly: "justify-evenly"
    }
    JUSTIFY_CONTENT_OPTIONS = [JUSTIFY_CONTENT_DEFAULT, *JUSTIFY_CONTENT_MAPPINGS.keys]

    ALIGN_ITEMS_DEFAULT = nil
    ALIGN_ITEMS_MAPPINGS = {
      start: "items-start",
      end: "items-end",
      center: "items-center",
      baseline: "items-baseline",
      stretch: "items-stretch"
    }
    ALIGN_ITEMS_OPTIONS = [ALIGN_ITEMS_DEFAULT, *ALIGN_ITEMS_MAPPINGS.keys]

    INLINE_DEFAULT = false
    INLINE_OPTIONS = [INLINE_DEFAULT, true]

    FLEX_WRAP_DEFAULT = nil
    FLEX_WRAP_OPTIONS = [FLEX_WRAP_DEFAULT, true, false, "reverse"]

    DEFAULT_DIRECTION = nil
    ALLOWED_DIRECTIONS = [DEFAULT_DIRECTION, :col, :col_reverse, :row, :row_reverse]

    def initialize(
      justify_content: JUSTIFY_CONTENT_DEFAULT,
      inline: INLINE_DEFAULT,
      flex_wrap: FLEX_WRAP_DEFAULT,
      align_items: ALIGN_ITEMS_DEFAULT,
      direction: nil,
      **kwargs
    )
      @align_items = fetch_or_fallback(ALIGN_ITEMS_OPTIONS, align_items, ALIGN_ITEMS_DEFAULT)
      @justify_content = fetch_or_fallback(JUSTIFY_CONTENT_OPTIONS, justify_content, JUSTIFY_CONTENT_DEFAULT)
      @flex_wrap = fetch_or_fallback(FLEX_WRAP_OPTIONS, flex_wrap, FLEX_WRAP_DEFAULT)

      # Support direction argument that is an array
      @direction =
        if (Array(direction) - ALLOWED_DIRECTIONS).empty?
          direction
        else
          DEFAULT_DIRECTION
        end
      @kwargs = kwargs.merge({direction: @direction}.compact)
      @kwargs[:classes] = class_names(@kwargs[:classes], component_class_names)
      @kwargs[:display] = fetch_or_fallback(INLINE_OPTIONS, inline, INLINE_DEFAULT) ? :inline_flex : :flex
    end

    def call
      render(Tailwind::BoxComponent.new(**@kwargs)) { content }
    end

    private

    def component_class_names
      out = []
      out << JUSTIFY_CONTENT_MAPPINGS[@justify_content]
      out << ALIGN_ITEMS_MAPPINGS[@align_items]

      out <<
        case @flex_wrap
        when "reverse"
          "flex-wrap-reverse"
        when true
          "flex-wrap"
        when false
          "flex-no-wrap"
        end

      out.compact.join(" ")
    end
  end
end

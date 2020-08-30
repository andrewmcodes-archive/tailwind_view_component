# frozen_string_literal: true

module Tailwind
  class FlexItemComponent < Tailwind::Component
    FLEX_AUTO_DEFAULT = false
    FLEX_AUTO_ALLOWED_VALUES = [FLEX_AUTO_DEFAULT, true]

    def initialize(flex_auto: FLEX_AUTO_DEFAULT, **kwargs)
      @kwargs = kwargs
      @kwargs[:classes] =
        class_names(
          @kwargs[:classes],
          "flex-auto" => fetch_or_fallback(FLEX_AUTO_ALLOWED_VALUES, flex_auto, FLEX_AUTO_DEFAULT)
        )
    end

    def call
      render(Tailwind::BoxComponent.new(**@kwargs)) { content }
    end
  end
end

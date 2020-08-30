# frozen_string_literal: true

module Tailwind
  class AvatarComponent < Tailwind::Component
    def initialize(src:, alt:, size: 20, square: false, **kwargs)
      @kwargs = kwargs
      @kwargs[:tag] = :img
      @kwargs[:src] = src
      @kwargs[:alt] = alt
      @kwargs[:size] = size
      @kwargs[:height] = size
      @kwargs[:width] = size

      @kwargs[:classes] = class_names(
        "inline-flex items-center justify-center",
        kwargs[:classes],
        "rounded-full" => !square
      )
    end

    def call
      render(Tailwind::BaseComponent.new(**@kwargs)) { content }
    end
  end
end

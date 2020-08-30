# frozen_string_literal: true

module Tailwind
  class TextComponent < Tailwind::Component
    def initialize(**kwargs)
      @kwargs = kwargs
      @kwargs[:tag] ||= :span
    end

    def call
      render(Tailwind::BaseComponent.new(**@kwargs)) { content }
    end
  end
end

# frozen_string_literal: true

module Tailwind
  class BoxComponent < Tailwind::Component
    def initialize(**kwargs)
      @kwargs = kwargs
      @kwargs[:tag] = :div
    end

    def call
      render(Tailwind::BaseComponent.new(**@kwargs)) { content }
    end
  end
end

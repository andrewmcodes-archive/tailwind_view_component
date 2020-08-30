# frozen_string_literal: true

module Tailwind
  class HeadingComponent < Tailwind::Component
    def initialize(**kwargs)
      @kwargs = kwargs
      @kwargs[:tag] ||= :h1
    end

    def call
      render(Tailwind::BaseComponent.new(**@kwargs)) { content }
    end
  end
end

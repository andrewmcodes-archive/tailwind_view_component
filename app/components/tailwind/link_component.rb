# frozen_string_literal: true

module Tailwind
  class LinkComponent < Tailwind::Component
    def initialize(href:, muted: false, **kwargs)
      @kwargs = kwargs
      @kwargs[:tag] = :a
      @kwargs[:href] = href
      @kwargs[:classes] = class_names(
        @kwargs[:classes],
        "muted-link" => fetch_or_fallback([true, false], muted, false)
      )
    end

    def call
      render(Tailwind::BaseComponent.new(**@kwargs)) { content }
    end
  end
end

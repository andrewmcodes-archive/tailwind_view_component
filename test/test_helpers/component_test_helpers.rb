# frozen_string_literal: true

module Tailwind
  module ComponentTestHelpers
    include ViewComponent::TestHelpers

    # For components using fetch_or_fallback,
    # we want to ensure that the correct
    # fallback behavior works in production.
    # The helper enables us to easily test
    # this production-only behavior.
    def without_fetch_or_fallback_raises(&block)
      FetchOrFallbackHelper.fallback_raises = false
      yield
    ensure
      FetchOrFallbackHelper.fallback_raises = true
    end
  end
end

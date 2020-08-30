# frozen_string_literal: true

module Tailwind
  class Slot < ViewComponent::Slot
    include ClassNameHelper
    include FetchOrFallbackHelper
  end
end

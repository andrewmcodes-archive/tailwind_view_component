# frozen_string_literal: true

module Tailwind
  class Component < ViewComponent::Base
    include ClassNameHelper
    include FetchOrFallbackHelper
    include OcticonsHelper
  end
end

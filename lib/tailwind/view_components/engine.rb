# frozen_string_literal: true

module Tailwind
  module ViewComponents
    class Engine < ::Rails::Engine
      isolate_namespace Tailwind::ViewComponents
    end
  end
end

require "#{Tailwind::ViewComponents::Engine.root}/app/components/tailwind/view_components.rb"

# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tailwind/view_components/version"

Gem::Specification.new do |spec|
  spec.name = "tailwind_view_component"
  spec.version = Tailwind::ViewComponents::VERSION::STRING
  spec.authors = ["Andrew Mason"]
  spec.email = ["andrewmcodes@protonmail.com"]

  spec.summary = "ViewComponents for the Tailwind Design System"
  spec.homepage = "https://github.com/andrewmcodes/tailwind_view_component"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["CHANGELOG.md", "LICENSE.txt", "README.md", "lib/**/*", "app/**/*"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rails", [">= 5.0.0", "< 7.0"]
  spec.add_runtime_dependency "view_component", [">= 2.0.0", "< 3.0"]
  spec.add_runtime_dependency "octicons_helper", [">= 9.0.0", "< 11.0.0"]
  spec.add_development_dependency "minitest", "= 5.6.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "standard", "~> 0.5"
end

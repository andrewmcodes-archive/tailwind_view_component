# frozen_string_literal: true

require "test_helper"

class TailwindComponentTest < Minitest::Test
  include Tailwind::ComponentTestHelpers

  def test_tailwind_components_provide_a_consistent_interface
    # Components with any arguments necessary to make them render
    components_with_args = [
      [Tailwind::BaseComponent, {tag: :div}],
      [Tailwind::BoxComponent, {}]
    ]

    ignored_components = ["Tailwind::Component"]

    tailwind_component_files_count = Dir["app/**/*component.rb"].count
    assert_equal tailwind_component_files_count, components_with_args.length + ignored_components.count, "Tailwind component added. Please update this test with an entry for your new component <3"

    components_with_args.each do |component, args, proc|
      # component renders hash arguments
      render_component(component, {my: 4}.merge(args), proc)
      assert_selector(".my-4")

      # component passes through class_names
      render_component(component, {classes: "foo"}.merge(args), proc)
      assert_selector(".foo")

      # component supports basic content_tag arguments
      render_component(component, {hidden: true}.merge(args), proc)
      assert_selector("[hidden]", visible: false)

      render_component(component, {"data-ga-click": "Foo,bar"}.merge(args), proc)
      assert_selector("[data-ga-click='Foo,bar']", visible: false)

      # Ensure all slots accept Tailwind kwargs
      if component.slots.any?
        render_inline(component.new(**args)) do |c|
          component.slots.each do |slot_name, slot_attributes|
            c.slot(
              slot_name,
              classes: "test-#{slot_name}",
              my: 1,
              hidden: true,
              "data-ga-click": "Foo,bar"
            ) { "foo" }
          end
        end

        component.slots.each do |slot_name, _attrs|
          assert_selector(".test-#{slot_name}.my-1[hidden][data-ga-click='Foo,bar']", visible: false)
        end
      end
    end
  end

  def render_component(component, args, proc)
    render_inline(component.new(**args)) do |c|
      proc.call(c) if proc.present?
    end
  end
end

# frozen_string_literal: true

class Tailwind::ButtonComponentStories < ViewComponent::Storybook::Stories
  layout "storybook_preview"

  story(:button) do
    controls do
      select(:button_type, Tailwind::StoriesHelper.array_to_options(Tailwind::ButtonComponent::BUTTON_TYPE_OPTIONS), :primary)
      select(:variant, Tailwind::StoriesHelper.array_to_options(Tailwind::ButtonComponent::VARIANT_OPTIONS), :medium)
      select(:tag, Tailwind::StoriesHelper.array_to_options(Tailwind::ButtonComponent::TAG_OPTIONS), :button)
      select(:type, Tailwind::StoriesHelper.array_to_options(Tailwind::ButtonComponent::TYPE_OPTIONS), :button)
      group_item false
    end
    content do
      "Click me"
    end
  end
end

# frozen_string_literal: true

class Tailwind::DetailsComponentStories < ViewComponent::Storybook::Stories
  layout "storybook_centered_preview"

  story(:details) do
    controls do
      select(:overlay, Tailwind::StoriesHelper.array_to_options(Tailwind::DetailsComponent::OVERLAY_MAPPINGS.keys), :none)
      reset false
    end

    content do |component|
      component.slot(:summary) { "Click me" }
      component.slot(:body) { "Body" }
    end
  end

  story(:custom_button) do
    controls do
      select(:overlay, Tailwind::StoriesHelper.array_to_options(Tailwind::DetailsComponent::OVERLAY_MAPPINGS.keys), :none)
    end

    content do |component|
      component.slot(:summary, variant: :small, button_type: :primary) { "Click me" }
      component.slot(:body) { "Body" }
    end
  end

  story(:without_button) do
    controls do
      select(:overlay, Tailwind::StoriesHelper.array_to_options(Tailwind::DetailsComponent::OVERLAY_MAPPINGS.keys), :none)
    end

    content do |component|
      component.slot(:summary, button: false) { "Click me" }
      component.slot(:body) { "Body" }
    end
  end
end

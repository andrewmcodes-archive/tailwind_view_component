# 🚧 [WIP]

## Tailwind ViewComponents

> ViewComponents for TailwindCSS

## Installation

In `Gemfile`, add:

```ruby
gem "tailwind_view_component"
```

In `config/application.rb`, add **after the application definition**

```ruby
require "tailwind/view_components/engine"
```

## Usage

### Built-in styling arguments

Tailwind components should be styled using the built-in arguments when possible. Most Tailwind utility classes for spacing, alignment, display, and colors have equivalent component arguments.

Example label built with Tailwind CSS:

```html
<span
  title="Label: Suggested"
  class="Label Label--outline Label--outline-green ml-2 v-align-middle"
  >Suggested</span
>
```

The same label using `Tailwind::LabelComponent`:

```erb
<%= render Tailwind::LabelComponent.new(ml: 2, vertical_align: :middle, scheme: :green, title: "Label: Suggested") do %>
  Suggested
<% end %>
```

Some components have their own specific arguments, but they can all be styled with the following arguments.

| Component argument | Tailwind class    | Example                                           |
| ------------------ | ----------------- | ------------------------------------------------- |
| `m`                | `m-<value>`       | `m: 4` → `.m-4`                                   |
| `my`               | `my-<value>`      | `my: 4` → `.my-4`                                 |
| `mx`               | `my-<value>`      | `mx: 4` → `.mx-4`                                 |
| `mt`               | `mt-<value>`      | `mt: 4` → `.mt-4`                                 |
| `mb`               | `mb-<value>`      | `mb: 4` → `.mb-4`                                 |
| `ml`               | `ml-<value>`      | `ml: 4` → `.ml-4`                                 |
| `mr`               | `mr-<value>`      | `mr: 4` → `.mr-4`                                 |
| `p`                | `p-<value>`       | `p: 4` → `.p-4`                                   |
| `py`               | `py-<value>`      | `py: 4` → `.py-4`                                 |
| `px`               | `py-<value>`      | `px: 4` → `.px-4`                                 |
| `pt`               | `pt-<value>`      | `pt: 4` → `.pt-4`                                 |
| `pb`               | `pb-<value>`      | `pb: 4` → `.pb-4`                                 |
| `pl`               | `pl-<value>`      | `pl: 4` → `.pl-4`                                 |
| `pr`               | `pr-<value>`      | `pr: 4` → `.pr-4`                                 |
| `pr`               | `pr-<value>`      | `pr: 4` → `.pr-4`                                 |
| `f`                | `f-<value>`       | `f: 4` → `.f-4`                                   |
| `color`            | `color-<value>`   | `color: :red_500` → `.color-red-500`              |
| `text`             | `text-<value>`    | `text: :green` → `.text-green`                    |
| `bg`               | `bg-<value>`      | `bg: :blue_light` → `.bg-blue-light`              |
| `display`          | `d-<value>`       | `display: :none` → `.d-none`                      |
| `float`            | `float-<value>`   | `float: :right` → `.float-right`                  |
| `vertical_align`   | `v-align-<value>` | `vertical_align: :baseline` → `.v-align-baseline` |
| `text_align`       | `text-<value>`    | `text_align: :right` → `.text-right`              |
| `font_size`        | `f<value>`        | `font_size: 4` → `.f4`                            |
| `font_weight`      | `text-<value>`    | `font_weight: :bold` → `.text-bold`               |
| `border`           | `border-<value>`  | `border: :bottom` → `.border-bottom`              |
| `border_color`     | `border-<value>`  | `border: :green` → `.border-green`                |
| `word_break`       | `wb-<value>`      | `word_break: :break_all` → `.wb-break-all`        |
| `direction`        | `flex-<value>`    | `direction: :row` → `.flex-row`                   |
| `justify_content`  | `justify-<value>` | `justify_content: :center` → `.justify-center`    |
| `align_items`      | `items-<value>`   | `align_items: :baseline` → `.items-baseline`      |
| `shadow`           | `shadow-<value>`  | `shadow: :md` → `.shadow-md`                      |

#### Boolean arguments

| Component arguments | True                                  | False                                |
| ------------------- | ------------------------------------- | ------------------------------------ |
| `underline`         | `underline: true` → `.text-underline` | `underline: false` → `.no-underline` |
| `top`               | n/a                                   | `top: false` → `.top-0`              |
| `bottom`            | n/a                                   | `bottom: false` → `.bottom-0`        |
| `left`              | n/a                                   | `left: false` → `.left-0`            |
| `right`             | n/a                                   | `right: false` → `.right-0`          |

#### Responsive arguments

Different classes can be used for different breakpoints just like in Tailwind CSS. Simply use an array with the four values required for `[none, small, medium, large]`. If no breakpoint is needed for a breakpoint, pass `nil`.

Example heading built with Tailwind CSS:

```html
<h1 class="mt-0 mt-lg-4">Hello world</h1>
```

The same label using `Tailwind::HeadingComponent`:

```erb
<%= render Tailwind::HeadingComponent.new(mt: [0, nil, nil, 4]) do %>
  Hello world
<% end %>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andrewmcodes/tailwind_view_component. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

### Setting up

Run

```bash
script/setup
```

to install all necessary dependencies

### Running tests

To run the full test suite:

```bash
bundle exec rake
```

### Storybook

_We recommend having [overmind](https://github.com/DarthSim/overmind) installed to run both rails and storybook, but it is not required._

To run storybook:

```bash
script/storybook
```

### Developing with another app

In your `Gemfile`, change:

```ruby
gem "tailwind_view_component"
```

to

```ruby
gem "tailwind_view_component", path: "path_to_the_gem" # e.g. path: "~/tailwind/view_components"
```

Then, `bundle install` to update references. You'll now be able to see changes from the gem without having to build it.
Remember that restarting the Rails server is necessary to see changes, as the gem is loaded at boot time.

To minimize the number of restarts, we recommend checking the component in Storybook first, and then when it's in a good state,
you can check it in your app.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

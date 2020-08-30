# frozen_string_literal: true

module Tailwind
  class BorderBoxComponent < Tailwind::Component
    include ViewComponent::Slotable

    with_slot :header, class_name: "Header"
    with_slot :body, class_name: "Body"
    with_slot :footer, class_name: "Footer"
    with_slot :row, collection: true, class_name: "Row"

    def initialize(**kwargs)
      @kwargs = kwargs
      @kwargs[:tag] = :div
      @kwargs[:classes] = class_names(
        "Box",
        kwargs[:classes]
      )
    end

    def render?
      rows.any? || header.present? || body.present? || footer.present?
    end

    class Header < Tailwind::Slot
      attr_reader :kwargs
      def initialize(**kwargs)
        @kwargs = kwargs
        @kwargs[:tag] = :div
        @kwargs[:classes] = class_names(
          "Box-header",
          kwargs[:classes]
        )
      end
    end

    class Body < Tailwind::Slot
      attr_reader :kwargs
      def initialize(**kwargs)
        @kwargs = kwargs
        @kwargs[:tag] = :div
        @kwargs[:classes] = class_names(
          "Box-body",
          kwargs[:classes]
        )
      end
    end

    class Footer < Tailwind::Slot
      attr_reader :kwargs
      def initialize(**kwargs)
        @kwargs = kwargs
        @kwargs[:tag] = :div
        @kwargs[:classes] = class_names(
          "Box-footer",
          kwargs[:classes]
        )
      end
    end

    class Row < Tailwind::Slot
      attr_reader :kwargs
      def initialize(**kwargs)
        @kwargs = kwargs
        @kwargs[:tag] = :li
        @kwargs[:classes] = class_names(
          "Box-row",
          kwargs[:classes]
        )
      end
    end
  end
end

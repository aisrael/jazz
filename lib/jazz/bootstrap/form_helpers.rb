module Jazz
  module Bootstrap
    module FormHelpers
      def plus_minus_field_tag(name, value = nil, options = {})
        content_tag :div, class: 'input-prepend input-append' do
          link_to('-', 'javascript:void(0);', class: 'jazz btn minus', data: { :for => name }) +
          number_field_tag(name, value, options) +
          link_to('+', 'javascript:void(0);', class: 'jazz btn plus', data: { :for => name })
        end
      end

      # When Jazz::Bootstrap::FormHelpers is included, monkey-patch ActionView::Helpers::FormBuilder
      def self.included(cl)
        ActionView::Helpers::FormBuilder.class_eval do
          def plus_minus_field(name, params = {})
            options = { min: 1, max: 9, length: 2, size: 2, class: 'jazz plus_minus' }.merge(params)
            # Mimic how InstanceTag does it
            sanitized_object_name = @object_name.to_s.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
            target_name = "#{sanitized_object_name}_#{name}"
            @template.raw("<div class=\"input-prepend input-append\"><a href=\"javascript:void(0)\" class=\"jazz btn minus\" data-for=\"#{target_name}\">-</a>") +
            number_field(name, options) +
            @template.raw("<a href=\"javascript:void(0)\" class=\"jazz btn plus\" data-for=\"#{target_name}\">+</a></div>")
          end
        end
      end
    end
  end
end

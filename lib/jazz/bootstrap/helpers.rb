module Jazz
  module Bootstrap
    module Helpers

      VOID = 'javascript:void(0);'

      # Render a <div class="btn-group"...>
      #
      def menu(items = {})
        content_tag :div, :class => 'btn-group' do
          raw(items.map { |text, target|
            button_to text, target
          }.join("\n"))
        end
      end

      def btn(*args, &block)
        params = if args.last.is_a?(Hash)
          {type: :button}.merge(args.pop)
        else
          {type: :button}
        end 
        text = args.shift

        button_text = if text.is_a?(Symbol)
          params[:name] = text unless params[:name]
          t(text, default: text.to_s.titleize)
        else
          text
        end

        if params[:class].is_a?(Array)
          params[:class].unshift 'btn' unless params[:class].find {|e| e.to_s == 'btn' }
        else
          params[:class] = ['btn', params[:class]].compact
        end

        params[:title] = t(params[:title], default: params[:title].to_s.titleize) if params[:title].is_a?(Symbol)

        if params.key?(:icon)
          icon = params.delete :icon
          # only works if famfam_icon defined at run-time
          button_tag(button_text, params) {
            concat famfam_icon(icon) if defined? famfam_icon
            concat button_text 
          }
        else
          button_tag(button_text, params, &block)
        end
      end

      #
      # Render an <a class="btn" ...> tag.
      #
      def btn_to(text, *args)
        text = t(text, default: text.to_s.titleize) if text.is_a?(Symbol)
        params = args.present? && args.last.is_a?(Hash) ? args.pop : {}
        target = args.shift || VOID

        if params[:class].is_a?(Array)
          params[:class] |= 'btn'
        else
          params[:class] = ['btn', params[:class]].compact
        end

        params[:title] = t(params[:title], default: params[:title].to_s.titleize) if params[:title].is_a?(Symbol)

        # only works if famfam_icon defined at run-time
        if params.key?(:icon)
          icon = params.delete :icon
          args << params
          link_to(target, *args) {
            concat famfam_icon(icon) if defined? famfam_icon
            concat text 
          }
        else
          args << params
          link_to(text, target, *args)
        end
      end

      def back_button(*args)
        params = args.last.is_a?(Hash) ? args.pop : {}
        params[:icon] ||= :arrow_undo
        target, path = case
        when args.size > 1
          [args.shift, args.shift]
        when args.size == 1
          [:back, args.shift]
        else
          [:back, :back]
        end
        btn_to target, path, *(args + [params])
      end
      alias_method :back_btn, :back_button

      # <table...> tag helper
      #
      # Usage (HAML):
      #
      #     = table :column_1, :column_2 do
      #       = render @rows
      #
      def table(*args, &block)
        params = args.present? && args.last.is_a?(Hash) ? args.pop : {}
        cl = params.delete(:class) || %w(table table-striped)
        cl = [cl] unless cl.is_a?(Array)

        options = {class: cl}.merge(params)
        content_tag :table, options do
          thead(args) +
          content_tag(:tbody, &block)
        end
      end

      # <thead> tag helper
      #
      # Usage:
      #
      #   = thead :column_a, :column_b # => <thead><tr><th>Column A</th><th>Column B</th></tr></thead>
      def thead(*args)
        headers = args.flatten.map {|a| content_tag :th, a.is_a?(Symbol) ? t(a, default: a.to_s.titleize) : a }.join
        content_tag(:thead, content_tag(:tr, raw(headers)))
      end

    end
  end
end

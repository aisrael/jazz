module Jazz
  module Helpers
    
    VOID = 'javascript:void(0);'
    
    def self.included(cl)
      ActionView::Helpers::FormBuilder.class_eval do
      
        def plus_minus_field(name, params = {})
          options = { min: 1, max: 9, length: 2, size: 2, class: 'jazz' }.merge(params)
          # Mimic how InstanceTag does it
          sanitized_object_name = @object_name.to_s.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
          target_name = "#{sanitized_object_name}_#{name}"
          @template.raw("<div class=\"input-prepend input-append\"><a href=\"javascript:void(0)\" class=\"jazz btn minus\" data-for=\"#{target_name}\">-</a>") +
          number_field(name, options) +
          @template.raw("<a href=\"javascript:void(0)\" class=\"jazz btn plus\" data-for=\"#{target_name}\">+</a></div>")
        end
      
      end
    end

    #
    # Render a <label../> tag
    #
    def label_for(target, *args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      unless args.empty?
        label_tag target, *args, options
      else
        label_tag target, "#{t(target, default: target.to_s.titleize)}:", options
      end
    end
  
    #
    # Render a <div class="btn-group"...>
    #
    def menu(items = {})
      content_tag :div, :class => 'btn-group' do
        raw(items.map { |text, target|
          button_to text, target
        }.join("\n"))
      end
    end
  
    #
    # Overloaded link helper
    #
    # Usage:
    #
    #     link :nowhere
    #       => <a href="javascript:void(0);">Nowhere</a>
    #
    #     link record
    #       = link_to record.name, record if record.respond_to?(:name)
    def link(to, *args)
      text = case
      when to.is_a?(Symbol)
        to = t(to, default: to.to_s.titleize)
      when to.is_a?(ActiveRecord::Base) && to.respond_to?(:name)
        to.name
      else
        to
      end
      options = { title: text }
      options.merge!(args.pop) if args.last.is_a?(Hash)
  
      target = args.shift 
      target ||= to.is_a?(ActiveRecord::Base) ? to : VOID
  
      link_to text, target, options, *args
    end
    
    def li_to(text, *args)
      params = args.last.is_a?(Hash) ? args.pop : {}
      li_options = params.slice(:class)
      if params.key?(:active)
        li_options[:class] = [li_options[:class], 'active'].compact if params.delete :active
      end
      content_tag :li, li_options do
        link(text, *args)
      end
    end
  
    # 
    # Render an <a class="btn" ...> tag.
    # 
    def button_to(text, *args)
      text = t(text, default: text.to_s.titleize) if text.is_a?(Symbol)
      params = args.present? && args.last.is_a?(Hash) ? args.pop : {}
      target = args.shift || VOID
  
      if params[:class].is_a?(Array)
        params[:class] << 'btn'
      else
        params[:class] = ['btn', params[:class]].compact
      end
  
      params[:title] = t(params[:title], default: params[:title].to_s.titleize) if params[:title].is_a?(Symbol)
  
      if params.key? :icon
        icon = params.delete :icon
        args << params
        link_to(target, *args) { famfam_icon(icon) + text }
      else
        args << params
        link_to(text, target, *args)
      end
    end
  
    def back_button(*args)
      target, path = case
      when args.size > 1
        [args.shift, args.shift]
      when args.size == 1
        [:back, args.shift]
      else
        [:back, :back]
      end
      if args.present? and args.last.is_a?(Hash)
        args.last[:icon] ||= :arrow_undo
      else
        args << { :icon  => :arrow_undo }
      end 
      button_to target, path, *args
    end
  
    #
    # <table...> tag helper
    #
    # Usage (HAML):
    #
    #     = table :column_1, :column_2 do
    #       = render @rows
    #
    def table(*args, &block)
      params = args.present? && args.last.is_a?(Hash) || {}
      cl = params.delete(:class) || %w(table table-striped)
      cl = [cl] unless cl.is_a?(Array)
  
      headers = args.flatten.map {|a| content_tag :th, a.is_a?(Symbol) ? t(a, default: a.to_s.titleize) : a }.join
      options = {class: cl}.merge(params)
      content_tag :table, options do
        content_tag(:thead, content_tag(:tr, raw(headers))) +
        content_tag(:tbody, &block)
      end
    end

  end
end
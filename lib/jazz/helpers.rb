require 'jazz/bootstrap/helpers'
require 'jazz/bootstrap/form_helpers'

module Jazz
  module Helpers
    
    VOID = 'javascript:void(0);'
    
    include Jazz::Bootstrap::Helpers
    include Jazz::Bootstrap::FormHelpers

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
    
    # Render an <li ...><%= link ... %></li>
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

  end
end
module Jazz
  module Bootstrap
    module FormHelpers    
      def plus_minus_field_tag(name)
        content_tag :div, class: 'input-prepend input-append' do
          link_to('-', 'javascript:void(0);', class: 'jazz btn minus', data: { :for => name }) +
          text_field_tag(name, nil, length: 2, class: 'jazz') +
          link_to('+', 'javascript:void(0);', class: 'jazz btn plus', data: { :for => name })
        end
      end
    end
  end
end

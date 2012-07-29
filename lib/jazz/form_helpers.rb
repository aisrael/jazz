module Jazz
  module FormHelpers    
    def plus_minus_field_tag(name)
      link_to('-', 'javascript:void(0);', class: 'jazz_button minus', data: { :for => name }) +
      text_field_tag(name, nil, :length => 2) +
      link_to('+', 'javascript:void(0);', class: 'jazz_button plus', data: { :for => name })
    end
  end
end

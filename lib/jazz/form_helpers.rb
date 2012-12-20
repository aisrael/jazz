module Jazz
  module FormHelpers

    # Renders an HTML 5 <input type="date"... >
    def date_field_tag(name, value = nil, args = {})
      options = { type: :date, name: name }.merge(args)
      options[:value] = value.is_a?(Date) ? value.strftime('%F') : value.to_s unless value.nil?
      tag :input, options
    end
  end
end

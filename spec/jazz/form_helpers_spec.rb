require 'spec_helper'

describe Jazz::FormHelpers, type: :helper do
  describe 'date_field_tag' do
    it 'renders an HTML 5 <input type="date" ...> tag' do
      helper.date_field_tag(:test).should eq('<input name="test" type="date" />')
    end
  end
end

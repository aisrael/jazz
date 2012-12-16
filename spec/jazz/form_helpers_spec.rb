require 'spec_helper'

require 'jazz/form_helpers'

describe Jazz::FormHelpers do
  include Jazz::FormHelpers
  describe 'date_field_tag' do
    it 'renders an HTML 5 <input type="date" ...> tag' do
      self.should_receive(:content_tag).with(:input, nil, type: :date, name: :test)
      date_field_tag :test
    end
  end
end

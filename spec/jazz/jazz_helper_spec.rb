require 'spec_helper'

require 'jazz_helper'

describe JazzHelper do

  require 'active_support'
  require 'active_record'
  require 'action_view'
  
  include ActionView::Helpers
  
  it { is_a? Module }

  include JazzHelper

  describe 'label_for' do
    it 'generates a <label...> tag' do
      self.should_receive(:t).with(:field, default: 'Field').and_return('Field')
      label_for(:field).should eq('<label for="field">Field</label>')
    end
  end
  
  describe 'link' do
    it 'generates an <a ...> tag' do
      link('Google', 'http://www.google.com').should eq('<a href="http://www.google.com" title="Google">Google</a>')
    end
  end
end

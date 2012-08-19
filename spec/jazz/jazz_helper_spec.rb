require 'spec_helper'

require 'active_record'
require 'action_view'
require 'rails-i18n'

require 'jazz_helper'

describe 'JazzHelper' do

  include JazzHelper
  
  it { is_a? Module }

  describe 'label_for' do
    it 'generates a <label...> tag' do
      self.should_receive(:t).with(:field, default: 'Field').and_return('Field')
      self.should_receive(:label_tag).with(:field, 'Field', {}).and_return('<label for="field">Field</label>')
      label_for(:field).should eq('<label for="field">Field</label>')
    end
  end
  
  describe 'link' do
    it 'generates an <a ...> tag' do
      self.should_receive(:link_to).with('Google', 'http://www.google.com', {title: 'Google'}).and_return('<a href="http://www.google.com">Google</a>')
      link('Google', 'http://www.google.com').should eq('<a href="http://www.google.com">Google</a>')
    end
  end
end

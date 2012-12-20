require 'spec_helper'

describe JazzHelper do

  describe 'label_for' do
    it 'generates a <label ...> tag' do
      helper.label_for(:field).should eq('<label for="field">Field</label>')
    end
  end

  describe 'link' do
    it 'generates an <a ...> tag' do
      helper.link('Google', 'http://www.google.com').should eq('<a href="http://www.google.com" title="Google">Google</a>')
    end
  end
end

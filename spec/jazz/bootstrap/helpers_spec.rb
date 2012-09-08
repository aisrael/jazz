require 'spec_helper'

require 'jazz/bootstrap/helpers'

describe Jazz::Bootstrap::Helpers do

  require 'active_support'
  require 'action_view'
  
  include ActionView::Helpers

  it { is_a? Module }

  include Jazz::Bootstrap::Helpers
  
  describe 'thead' do
    it 'generates a <thead ...> tag' do
      self.should_receive(:t).with(:a, default: 'A').and_return('A')
      self.should_receive(:t).with(:b, default: 'B').and_return('B')
      thead(:a, :b).should eq '<thead><tr><th>A</th><th>B</th></tr></thead>'
    end
  end
end

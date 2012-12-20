require 'spec_helper'

describe Jazz::Bootstrap::Helpers, type: :helper do

  describe 'thead' do
    it 'generates a <thead ...> tag' do
      helper.thead(:a, :b).should eq '<thead><tr><th>A</th><th>B</th></tr></thead>'
    end
  end
end

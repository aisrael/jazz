require 'spec_helper'

describe Jazz::Bootstrap::Helpers, type: :helper do

  describe 'thead' do
    it 'generates a <thead ...> tag' do
      helper.thead(:a, :b).should eq '<thead><tr><th>A</th><th>B</th></tr></thead>'
    end
  end
  
  describe 'btn' do
    it 'generates a <button ...> tag' do
      helper.btn(:delete).should eq '<button class="btn" name="delete" type="button">Delete</button>'
    end
    it 'allows you to override :name' do
      helper.btn(:delete, name: 'my_button').should eq '<button class="btn" name="my_button" type="button">Delete</button>'
    end
    it 'allows you to override :type' do
      helper.btn(:delete, type: :submit).should eq '<button class="btn" name="delete" type="submit">Delete</button>'
    end
    it 'allows additional classes' do
      helper.btn(:delete, class: %w(btn-primary custom)).should eq '<button class="btn btn-primary custom" name="delete" type="button">Delete</button>'
    end
    it 'allows any other parameter through' do
      helper.btn(:delete, data: {confirm: 'Are you sure?'}).should eq '<button class="btn" data-confirm="Are you sure?" name="delete" type="button">Delete</button>'
    end
  end
end

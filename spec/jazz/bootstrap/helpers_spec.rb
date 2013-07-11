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
    it 'works' do
      helper.btn(:delete, data: {confirm: 'Are you sure?'}, title: :delete_person).should eq '<button class="btn" data-confirm="Are you sure?" name="delete" title="Delete Person" type="button">Delete</button>'
    end
    it 'allows you to provide a block for content' do
      helper.btn(data: {confirm: 'Are you sure?'}, title: :delete_person) {
        helper.sanitize(helper.content_tag(:i, nil, class: 'icon-remove'))
      }.should eq '<button class="btn" data-confirm="Are you sure?" name="button" title="Delete Person" type="button"><i class="icon-remove"></i></button>'
    end
  end
  
  describe 'back_btn' do
    it 'generates a back btn link' do
      helper.back_btn.should eq '<a class="btn" href="javascript:history.back()">Back</a>'
    end
    it 'allows an additional class' do
      helper.back_btn(class: 'back').should eq '<a class="btn back" href="javascript:history.back()">Back</a>'
    end
  end
end

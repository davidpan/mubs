require File.dirname(__FILE__) + '/../../spec_helper'

describe "/categories/show.html.erb" do
  include CategoriesHelper
  
  before(:each) do
    @category = mock_model(Category)
    @category.stub!(:name).and_return()
    @category.stub!(:parent_id).and_return()
    @category.stub!(:tree_id).and_return()
    @category.stub!(:image).and_return()
    @category.stub!(:color).and_return()
    @category.stub!(:lft).and_return()
    @category.stub!(:rgt).and_return("1")

    assigns[:category] = @category
  end

  it "should render attributes in <p>" do
    render "/categories/show.html.erb"
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(/1/)
  end
end


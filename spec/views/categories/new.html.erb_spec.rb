require File.dirname(__FILE__) + '/../../spec_helper'

describe "/categories/new.html.erb" do
  include CategoriesHelper
  
  before(:each) do
    @category = mock_model(Category)
    @category.stub!(:new_record?).and_return(true)
    @category.stub!(:name).and_return()
    @category.stub!(:parent_id).and_return()
    @category.stub!(:tree_id).and_return()
    @category.stub!(:image).and_return()
    @category.stub!(:color).and_return()
    @category.stub!(:lft).and_return()
    @category.stub!(:rgt).and_return("1")
    assigns[:category] = @category
  end

  it "should render new form" do
    render "/categories/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", categories_path) do
      with_tag("input#category_name[name=?]", "category[name]")
      with_tag("input#category_image[name=?]", "category[image]")
      with_tag("input#category_color[name=?]", "category[color]")
      with_tag("input#category_lft[name=?]", "category[lft]")
      with_tag("input#category_rgt[name=?]", "category[rgt]")
    end
  end
end



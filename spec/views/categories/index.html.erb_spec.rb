require File.dirname(__FILE__) + '/../../spec_helper'

describe "/categories/index.html.erb" do
  include CategoriesHelper
  
  before(:each) do
    category_98 = mock_model(Category)
    category_98.should_receive(:name).and_return()
    category_98.should_receive(:parent_id).and_return()
    category_98.should_receive(:tree_id).and_return()
    category_98.should_receive(:image).and_return()
    category_98.should_receive(:color).and_return()
    category_98.should_receive(:lft).and_return()
    category_98.should_receive(:rgt).and_return("1")
    category_99 = mock_model(Category)
    category_99.should_receive(:name).and_return()
    category_99.should_receive(:parent_id).and_return()
    category_99.should_receive(:tree_id).and_return()
    category_99.should_receive(:image).and_return()
    category_99.should_receive(:color).and_return()
    category_99.should_receive(:lft).and_return()
    category_99.should_receive(:rgt).and_return("1")

    assigns[:categories] = [category_98, category_99]
  end

  it "should render list of categories" do
    render "/categories/index.html.erb"
    response.should have_tag("tr>td", '', 2)
    response.should have_tag("tr>td", '', 2)
    response.should have_tag("tr>td", '', 2)
    response.should have_tag("tr>td", '', 2)
    response.should have_tag("tr>td", "1", 2)
  end
end


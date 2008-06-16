require File.dirname(__FILE__) + '/../spec_helper'

describe Category, "with fixture" do
  fixtures :categories, :blogs, :articles, :users
  
  before(:each) do
    @category = Category.find(1)
  end

  it "should be valid" do
    @category.should be_valid
  end
end

describe Category, "new created" do
  fixtures :categories
  
  before(:each) do
    @category = Category.new(valid_category_hash)
  end

  it "should be valid" do
    @category.should be_valid
  end
  
  it "should not be valid without a name" do
    @category.name = ''
    @category.should_not be_valid
  end
  
  it "should not be valid with exist title" do
    @new_category = Category.new(exist_category_name_hash)
    @new_category.should_not be_valid
  end

  def valid_category_hash
    {:name => 'IT', :description => 'info tech'}
  end

  def exist_category_name_hash
    {:name => "放心情", :description => '水区'}
  end
end

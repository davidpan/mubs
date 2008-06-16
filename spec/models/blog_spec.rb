require File.dirname(__FILE__) + '/../spec_helper'

describe Blog, "with fixtures loaded" do
  fixtures :blogs, :articles, :users
  
  before(:each) do
    @blog = Blog.find(1)
  end

  it "should be valid" do
    @blog.should be_valid
  end
  
  it "should have many articles" do
    pending
  end
  
  it "should have at least one admin" do
    pending
  end
  
end

describe Blog, "new created" do

  before(:each) do
    @blog = Blog.new
  end

  it "should be valid" do
    @blog.should be_valid
  end
  
  it "should have many articles" do
    pending
  end
  
  it "should have at least one admin" do
    pending
  end
  
end
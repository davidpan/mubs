require File.dirname(__FILE__) + '/../spec_helper'

describe Article, "with fixtures loaded" do
  fixtures :blogs, :articles, :users  
  before(:each) do
    @article = Article.find(1)
  end

  it "should be valid" do
    @article.should be_valid
  end
  
  it "should have three records" do
    Article.should have(3).record
  end
  
end

describe Article, "new created" do
  fixtures :articles
  before(:each) do
    @article = Article.new(valid_article_hash)
  end

  it "should be valid" do
    @article.should be_valid
  end
  
  it "should not be valid without a title" do
    @article.title = ''
    @article.should_not be_valid
  end
  
  it "should not be valid with exist title" do
    @new_article = Article.new(exist_article_title_hash)
    @new_article.should_not be_valid
  end
  
  it "should not be valid without body" do
    @article.body = ''
    @article.should_not be_valid
  end
  
  def valid_article_hash
    {:title => 'test article', :body => 'body of test article'}
  end

  def exist_article_title_hash
    {:title => "first article's title", :body => 'blabla'}
  end
end
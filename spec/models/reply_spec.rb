require File.dirname(__FILE__) + '/../spec_helper'

describe Reply, "to fixture article" do
  fixtures :blogs, :articles, :users  
  before(:each) do
    @article = Article.find(1)
    @reply = Reply.new(valid_reply_hash)
    @reply.parent_id = @article.id
    @reply.thread_id = @article.thread_id # 回复和被回复贴有同样的thread_id
    # @reply.author = current_user.login
  end

  it "should be valid" do
    @reply.should be_valid
  end
  
  it "should not be valid without body" do
    @reply.body = ''
    @reply.should_not be_valid
  end
  
  it "should let is_relpy be true" do
    @reply.is_reply?.should be_true
  end
  
  it "should let parent_id be 1" do
    @reply.parent_id.should == 1
  end
  
  it "should let thread_id be 1" do
    @reply.thread_id.should == 1   
  end
  
  def valid_reply_hash
    {:title => 'reply test article', :body => 'body of reply test article', :is_reply => true}
  end
  
end

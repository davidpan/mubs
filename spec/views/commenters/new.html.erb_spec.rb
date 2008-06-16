require File.dirname(__FILE__) + '/../../spec_helper'

describe "/commenters/new.html.erb" do
  include CommentersHelper
  
  before(:each) do
    @commenter = mock_model(Commenter)
    @commenter.stub!(:new_record?).and_return(true)
    assigns[:commenter] = @commenter
  end

  it "should render new form" do
    render "/commenters/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", commenters_path) do
    end
  end
end



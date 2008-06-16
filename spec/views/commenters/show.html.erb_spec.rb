require File.dirname(__FILE__) + '/../../spec_helper'

describe "/commenters/show.html.erb" do
  include CommentersHelper
  
  before(:each) do
    @commenter = mock_model(Commenter)

    assigns[:commenter] = @commenter
  end

  it "should render attributes in <p>" do
    render "/commenters/show.html.erb"
  end
end


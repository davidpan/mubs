require File.dirname(__FILE__) + '/../../spec_helper'

describe "/commenters/index.html.erb" do
  include CommentersHelper
  
  before(:each) do
    commenter_98 = mock_model(Commenter)
    commenter_99 = mock_model(Commenter)

    assigns[:commenters] = [commenter_98, commenter_99]
  end

  it "should render list of commenters" do
    render "/commenters/index.html.erb"
  end
end


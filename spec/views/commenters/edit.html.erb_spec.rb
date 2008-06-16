require File.dirname(__FILE__) + '/../../spec_helper'

describe "/commenters/edit.html.erb" do
  include CommentersHelper
  
  before do
    @commenter = mock_model(Commenter)
    assigns[:commenter] = @commenter
  end

  it "should render edit form" do
    render "/commenters/edit.html.erb"
    
    response.should have_tag("form[action=#{commenter_path(@commenter)}][method=post]") do
    end
  end
end



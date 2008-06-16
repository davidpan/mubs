require File.dirname(__FILE__) + '/../../spec_helper'

describe "/blogs/edit.html.erb" do
  include BlogsHelper
  
  before do
    @blog = mock_model(Blog)
    assigns[:blog] = @blog
  end

  it "should render edit form" do
    render "/blogs/edit.html.erb"
    
    response.should have_tag("form[action=#{blog_path(@blog)}][method=post]") do
    end
  end
end



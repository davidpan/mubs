require File.dirname(__FILE__) + '/../../spec_helper'

describe "/blogs/new.html.erb" do
  include BlogsHelper
  
  before(:each) do
    @blog = mock_model(Blog)
    @blog.stub!(:new_record?).and_return(true)
    assigns[:blog] = @blog
  end

  it "should render new form" do
    render "/blogs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", blogs_path) do
    end
  end
end



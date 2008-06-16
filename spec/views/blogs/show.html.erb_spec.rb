require File.dirname(__FILE__) + '/../../spec_helper'

describe "/blogs/show.html.erb" do
  include BlogsHelper
  
  before(:each) do
    @blog = mock_model(Blog)

    assigns[:blog] = @blog
  end

  it "should render attributes in <p>" do
    render "/blogs/show.html.erb"
  end
end


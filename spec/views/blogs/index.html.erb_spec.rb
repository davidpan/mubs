require File.dirname(__FILE__) + '/../../spec_helper'

describe "/blogs/index.html.erb" do
  include BlogsHelper
  
  before(:each) do
    blog_98 = mock_model(Blog)
    blog_99 = mock_model(Blog)

    assigns[:blogs] = [blog_98, blog_99]
  end

  it "should render list of blogs" do
    render "/blogs/index.html.erb"
  end
end


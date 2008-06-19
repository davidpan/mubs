require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OpenId do
  before(:each) do
    @open_id = OpenId.new
  end

  it "should be valid" do
    @open_id.should be_valid
  end
end

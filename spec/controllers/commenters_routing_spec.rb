require File.dirname(__FILE__) + '/../spec_helper'

describe CommentersController do
  describe "route generation" do

    it "should map { :controller => 'commenters', :action => 'index' } to /commenters" do
      route_for(:controller => "commenters", :action => "index").should == "/commenters"
    end
  
    it "should map { :controller => 'commenters', :action => 'new' } to /commenters/new" do
      route_for(:controller => "commenters", :action => "new").should == "/commenters/new"
    end
  
    it "should map { :controller => 'commenters', :action => 'show', :id => 1 } to /commenters/1" do
      route_for(:controller => "commenters", :action => "show", :id => 1).should == "/commenters/1"
    end
  
    it "should map { :controller => 'commenters', :action => 'edit', :id => 1 } to /commenters/1/edit" do
      route_for(:controller => "commenters", :action => "edit", :id => 1).should == "/commenters/1/edit"
    end
  
    it "should map { :controller => 'commenters', :action => 'update', :id => 1} to /commenters/1" do
      route_for(:controller => "commenters", :action => "update", :id => 1).should == "/commenters/1"
    end
  
    it "should map { :controller => 'commenters', :action => 'destroy', :id => 1} to /commenters/1" do
      route_for(:controller => "commenters", :action => "destroy", :id => 1).should == "/commenters/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'commenters', action => 'index' } from GET /commenters" do
      params_from(:get, "/commenters").should == {:controller => "commenters", :action => "index"}
    end
  
    it "should generate params { :controller => 'commenters', action => 'new' } from GET /commenters/new" do
      params_from(:get, "/commenters/new").should == {:controller => "commenters", :action => "new"}
    end
  
    it "should generate params { :controller => 'commenters', action => 'create' } from POST /commenters" do
      params_from(:post, "/commenters").should == {:controller => "commenters", :action => "create"}
    end
  
    it "should generate params { :controller => 'commenters', action => 'show', id => '1' } from GET /commenters/1" do
      params_from(:get, "/commenters/1").should == {:controller => "commenters", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'commenters', action => 'edit', id => '1' } from GET /commenters/1;edit" do
      params_from(:get, "/commenters/1/edit").should == {:controller => "commenters", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'commenters', action => 'update', id => '1' } from PUT /commenters/1" do
      params_from(:put, "/commenters/1").should == {:controller => "commenters", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'commenters', action => 'destroy', id => '1' } from DELETE /commenters/1" do
      params_from(:delete, "/commenters/1").should == {:controller => "commenters", :action => "destroy", :id => "1"}
    end
  end
end
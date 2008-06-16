require File.dirname(__FILE__) + '/../spec_helper'

# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead
# Then, you can remove it from this and the units test.
include AuthenticatedTestHelper

describe CommentersController do
  fixtures :commenters

  it 'allows signup' do
    lambda do
      create_commenter
      response.should be_redirect      
    end.should change(Commenter, :count).by(1)
  end

  
  it 'signs up user in pending state' do
    create_commenter
    assigns[:commenter].should be_pending
  end

  
  it 'signs up user with activation code' do
    create_commenter
    assigns[:commenter].activation_code.should_not be_nil
  end

  it 'requires login on signup' do
    lambda do
      create_commenter(:login => nil)
      assigns[:commenter].errors.on(:login).should_not be_nil
      response.should be_success
    end.should_not change(Commenter, :count)
  end
  
  it 'requires password on signup' do
    lambda do
      create_commenter(:password => nil)
      assigns[:commenter].errors.on(:password).should_not be_nil
      response.should be_success
    end.should_not change(Commenter, :count)
  end
  
  it 'requires password confirmation on signup' do
    lambda do
      create_commenter(:password_confirmation => nil)
      assigns[:commenter].errors.on(:password_confirmation).should_not be_nil
      response.should be_success
    end.should_not change(Commenter, :count)
  end

  it 'requires email on signup' do
    lambda do
      create_commenter(:email => nil)
      assigns[:commenter].errors.on(:email).should_not be_nil
      response.should be_success
    end.should_not change(Commenter, :count)
  end
  
  
  it 'activates user' do
    Commenter.authenticate('aaron', 'test').should be_nil
    get :activate, :activation_code => commenters(:aaron).activation_code
    response.should redirect_to('/')
    flash[:notice].should_not be_nil
    Commenter.authenticate('aaron', 'test').should == commenters(:aaron)
  end
  
  it 'does not activate user without key' do
    get :activate
    flash[:notice].should be_nil
  end
  
  it 'does not activate user with blank key' do
    get :activate, :activation_code => ''
    flash[:notice].should be_nil
  end
  
  def create_commenter(options = {})
    post :create, :commenter => { :login => 'quire', :email => 'quire@example.com',
      :password => 'quire', :password_confirmation => 'quire' }.merge(options)
  end
end
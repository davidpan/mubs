require File.dirname(__FILE__) + '/../spec_helper'

# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead.
# Then, you can remove it from this and the functional test.
include AuthenticatedTestHelper

describe Commenter do
  fixtures :commenters

  describe 'being created' do
    before do
      @commenter = nil
      @creating_commenter = lambda do
        @commenter = create_commenter
        violated "#{@commenter.errors.full_messages.to_sentence}" if @commenter.new_record?
      end
    end
    
    it 'increments User#count' do
      @creating_commenter.should change(Commenter, :count).by(1)
    end

    it 'initializes #activation_code' do
      @creating_commenter.call
      @commenter.reload.activation_code.should_not be_nil
    end

    it 'starts in pending state' do
      @creating_commenter.call
      @commenter.should be_pending
    end
  end

  it 'requires login' do
    lambda do
      u = create_commenter(:login => nil)
      u.errors.on(:login).should_not be_nil
    end.should_not change(Commenter, :count)
  end

  it 'requires password' do
    lambda do
      u = create_commenter(:password => nil)
      u.errors.on(:password).should_not be_nil
    end.should_not change(Commenter, :count)
  end

  it 'requires password confirmation' do
    lambda do
      u = create_commenter(:password_confirmation => nil)
      u.errors.on(:password_confirmation).should_not be_nil
    end.should_not change(Commenter, :count)
  end

  it 'requires email' do
    lambda do
      u = create_commenter(:email => nil)
      u.errors.on(:email).should_not be_nil
    end.should_not change(Commenter, :count)
  end

  it 'resets password' do
    commenters(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    Commenter.authenticate('quentin', 'new password').should == commenters(:quentin)
  end

  it 'does not rehash password' do
    commenters(:quentin).update_attributes(:login => 'quentin2')
    Commenter.authenticate('quentin2', 'test').should == commenters(:quentin)
  end

  it 'authenticates commenter' do
    Commenter.authenticate('quentin', 'test').should == commenters(:quentin)
  end

  it 'sets remember token' do
    commenters(:quentin).remember_me
    commenters(:quentin).remember_token.should_not be_nil
    commenters(:quentin).remember_token_expires_at.should_not be_nil
  end

  it 'unsets remember token' do
    commenters(:quentin).remember_me
    commenters(:quentin).remember_token.should_not be_nil
    commenters(:quentin).forget_me
    commenters(:quentin).remember_token.should be_nil
  end

  it 'remembers me for one week' do
    before = 1.week.from_now.utc
    commenters(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    commenters(:quentin).remember_token.should_not be_nil
    commenters(:quentin).remember_token_expires_at.should_not be_nil
    commenters(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

  it 'remembers me until one week' do
    time = 1.week.from_now.utc
    commenters(:quentin).remember_me_until time
    commenters(:quentin).remember_token.should_not be_nil
    commenters(:quentin).remember_token_expires_at.should_not be_nil
    commenters(:quentin).remember_token_expires_at.should == time
  end

  it 'remembers me default two weeks' do
    before = 2.weeks.from_now.utc
    commenters(:quentin).remember_me
    after = 2.weeks.from_now.utc
    commenters(:quentin).remember_token.should_not be_nil
    commenters(:quentin).remember_token_expires_at.should_not be_nil
    commenters(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

  it 'registers passive commenter' do
    commenter = create_commenter(:password => nil, :password_confirmation => nil)
    commenter.should be_passive
    commenter.update_attributes(:password => 'new password', :password_confirmation => 'new password')
    commenter.register!
    commenter.should be_pending
  end

  it 'suspends commenter' do
    commenters(:quentin).suspend!
    commenters(:quentin).should be_suspended
  end

  it 'does not authenticate suspended commenter' do
    commenters(:quentin).suspend!
    Commenter.authenticate('quentin', 'test').should_not == commenters(:quentin)
  end

  it 'deletes commenter' do
    commenters(:quentin).deleted_at.should be_nil
    commenters(:quentin).delete!
    commenters(:quentin).deleted_at.should_not be_nil
    commenters(:quentin).should be_deleted
  end

  describe "being unsuspended" do
    fixtures :commenters

    before do
      @commenter = commenters(:quentin)
      @commenter.suspend!
    end
    
    it 'reverts to active state' do
      @commenter.unsuspend!
      @commenter.should be_active
    end
    
    it 'reverts to passive state if activation_code and activated_at are nil' do
      Commenter.update_all :activation_code => nil, :activated_at => nil
      @commenter.reload.unsuspend!
      @commenter.should be_passive
    end
    
    it 'reverts to pending state if activation_code is set and activated_at is nil' do
      Commenter.update_all :activation_code => 'foo-bar', :activated_at => nil
      @commenter.reload.unsuspend!
      @commenter.should be_pending
    end
  end

protected
  def create_commenter(options = {})
    record = Commenter.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire' }.merge(options))
    record.register! if record.valid?
    record
  end
end

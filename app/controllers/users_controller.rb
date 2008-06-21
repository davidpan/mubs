class UsersController < ApplicationController
  
  # Protect these actions behind an admin login
  before_filter :admin_required, :only => [:suspend, :unsuspend, :destroy, :purge]
  before_filter :find_user, :only => [:suspend, :unsuspend, :destroy, :purge]
  
  def index
    @users=User.find(:all)
  end
  
  def show
    @user=User.find(params[:id])
  end

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @open_id = OpenId.new(params[:open_id])
    @user.open_ids << @open_id if @open_id.save!
    @user.register! if @user && @user.valid?
    success = @user && @user.valid?
    if success && @user.errors.empty?
            redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  def edit
    @user=User.find(params[:id])
    @open_ids = @user.open_ids
  end
  
  
=begin
  Parameters: {
    "user"=>{
      "name"=>"jayesoui", 
      "password_confirmation"=>"",
      "open_id_attributes"=>{
        "new"=>{
          "0"=>{"url"=>"http://测试.myopenid.com/ "},
          "1"=>{"url"=>"http://stainless.myopenid.com/"}, 
          "2"=>{"url"=>""}
        }
      }, 
      "login"=>"jayesoui", 
      "password"=>"", 
      "email"=>"johnsonqu@live.com"
    },
    "commit"=>"Update", 
    "authenticity_token"=>"cf33167a49d72312a9789c3e8ecd5c2493b6ce0f", 
    "_method"=>"put", 
    "action"=>"update", 
    "id"=>"3", 
    "controller"=>"users"
  }
=end
  def update
    @user = User.find(params[:id])
    # @open_id = OpenId.new(params[:open_id])
    # @user.open_ids << @open_id if @open_id.save!
    @user.open_id_attributes = params[:open_id_attributes]
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

  def suspend
    @user.suspend! 
    redirect_to users_path
  end

  def unsuspend
    @user.unsuspend! 
    redirect_to users_path
  end

  def destroy
    @user.delete!
    redirect_to users_path
  end

  def purge
    @user.destroy
    redirect_to users_path
  end
  
  # There's no page here to update or destroy a user.  If you add those, be
  # smart -- make sure you check that the visitor is authorized to do so, that they
  # supply their old password along with a new one to update it, etc.

protected
  def find_user
    @user = User.find(params[:id])
  end
end

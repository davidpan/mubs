class CommentersController < ApplicationController
  
  # Protect these actions behind an admin login
  # before_filter :admin_required, :only => [:suspend, :unsuspend, :destroy, :purge]
  before_filter :find_commenter, :only => [:suspend, :unsuspend, :destroy, :purge]
  

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @commenter = Commenter.new(params[:commenter])
    @commenter.register! if @commenter.valid?
    if @commenter.errors.empty?
      self.current_commenter = @commenter
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  def activate
    self.current_commenter = params[:activation_code].blank? ? :false : Commenter.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_commenter.active?
      current_commenter.activate!
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

  def suspend
    @commenter.suspend! 
    redirect_to commenters_path
  end

  def unsuspend
    @commenter.unsuspend! 
    redirect_to commenters_path
  end

  def destroy
    @commenter.delete!
    redirect_to commenters_path
  end

  def purge
    @commenter.destroy
    redirect_to commenters_path
  end

protected
  def find_commenter
    @commenter = Commenter.find(params[:id])
  end

end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'c71d035f25b00af2ff020c1172e5441b'

  # lib/authenticated_system
  include AuthenticatedSystem
  
  # layout 'main'

  # Globalize插件设置语言
  before_filter :init_page, :set_locale

  private
  def init_page
    session[:user] = 'users'
  end

  # Globalize插件设置语言
  # Will set the session 'locale' if (and only if) an explicit parameter 'locale'
  # is passed (and is acceptable)
  # If no session exists, we look through the list of desired languages for the
  # first one we can accept.
  def set_locale
    accept_locales = LOCALES.keys # change this line as needed, must be an array of strings
    session[:locale] = params[:locale] if accept_locales.include?(params[:locale])
    Locale.set(session[:locale] || (request.env["HTTP_ACCEPT_LANGUAGE"] || "").scan(/[^,;]+/).find{|l| accept_locales.include?(l)})
  end
  
  def set_timezone
    if logged_in?
      Time.zone = current_user.time_zone
    else
      Time.zone = 'UTC'
    end
  end
  
end

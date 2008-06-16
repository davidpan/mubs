class CommenterMailer < ActionMailer::Base
  def signup_notification(commenter)
    setup_email(commenter)
    @subject    += 'Please activate your new account'
  
    @body[:url]  = "http://YOURSITE/activate/#{commenter.activation_code}"
  
  end
  
  def activation(commenter)
    setup_email(commenter)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://YOURSITE/"
  end
  
  protected
    def setup_email(commenter)
      @recipients  = "#{commenter.email}"
      @from        = "ADMINEMAIL"
      @subject     = "[YOURSITE] "
      @sent_on     = Time.now
      @body[:commenter] = commenter
    end
end

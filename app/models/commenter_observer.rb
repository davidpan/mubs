class CommenterObserver < ActiveRecord::Observer
  def after_create(commenter)
    CommenterMailer.deliver_signup_notification(commenter)
  end

  def after_save(commenter)
  
    CommenterMailer.deliver_activation(commenter) if commenter.pending?
  
  end
end

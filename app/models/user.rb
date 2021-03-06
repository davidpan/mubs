require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include Authorization::StatefulRoles

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40, :too_long => :"pick a shorter login".t,
                                                         :too_short => :"pick a longer login".t
  validates_uniqueness_of   :login,    :case_sensitive => false
  validates_format_of       :login,    :with => RE_LOGIN_OK, :message => MSG_LOGIN_BAD

  validates_format_of       :name,     :with => RE_NAME_OK,  :message => MSG_NAME_BAD, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email,    :case_sensitive => false
  validates_format_of       :email,    :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD
  
  has_many :open_ids , :attributes => true, :discard_if => proc { |open_id| open_id.url.blank? } # use attribute_fu plugin
  has_many :memberships
  has_many :blogs, :through => :memberships

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :time_zone, :open_id_attributes# :open_id_attributes 为 attribute_ful 插件添加的实例方法

  named_scope :recent, :limit => 15, :order => "created_at DESC"

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    u = find_in_state :first, :active, :conditions => {:login => login} # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  protected
    
    def make_activation_code
        self.deleted_at = nil
        self.activation_code = self.class.make_token
    end
    
end

class OpenId < ActiveRecord::Base
  validates_uniqueness_of   :url,    :case_sensitive => false

  belongs_to :user #, :class_name => "User", :foreign_key => "user_id"

  def blank?
    self.url.blank?
  end

  protected

  def validate
    begin
      if self.url
        # 将unicode字符编码URI为符合IDN标准的ascii punycode URI
        idn = Idna.toASCII(self.url.gsub(/[a-zA-Z]+:\/\//,''))
        # 将OpenID标准化
        self.url= OpenIdAuthentication.normalize_url(idn)
      end
    rescue
      errors.add :url, '(OpenID) invalid! It should be a normal URI.'
    end
  end
end

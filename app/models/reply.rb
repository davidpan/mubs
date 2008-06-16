class Reply < ActiveRecord::Base
  
  validates_presence_of :body
  
  self.table_name="articles"
  belongs_to :article,
             :class_name => "Article",
             :foreign_key => "parent_id",:conditions => "is_reply is true"
  
  def self.find_new(per)
    self.find(:all,:limit => per,:conditions => {:is_reply => TRUE}, :order => "created_at DESC")
  end
end

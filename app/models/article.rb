class Article < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :body
  validates_uniqueness_of :title
  
  has_and_belongs_to_many :blog
  
  def self.find_new(per)
    self.find(:all, :limit => per, 
              :conditions => ['parent_id is null'],
              :order => "created_at DESC")
  end
  
end

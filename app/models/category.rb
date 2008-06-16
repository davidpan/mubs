class Category < ActiveRecord::Base
  acts_as_nested_set :scope => :tree_id
  has_and_belongs_to_many(:articles,:order => "published_at DESC, created_at DESC",:uniq => true)
  has_and_belongs_to_many :lists, :order => :position 

  validates_presence_of :name
  validates_uniqueness_of :name, :on => :create

  def leaf?  
    if self.rgt - self.lft == 1  
      return true  
    else  
      return false  
    end   
  end

end

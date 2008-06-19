class Blog < ActiveRecord::Base
  has_and_belongs_to_many  :articles
  has_many :memberships
  has_many :users, :through => :memberships
end

class CreateBlogsUsers < ActiveRecord::Migration
  def self.up
    create_table :blogs_users, :id => false do |t|
      t.column :blog_id, :integer
      t.column :category_id, :integer
    end
    add_index :blogs_users, [:blog_id, :category_id] 
    add_index :blogs_users, :category_id
  end

  def self.down
    drop_table :blogs_users
  end
end


class CreateArticlesBlogs < ActiveRecord::Migration
  def self.up
    create_table :articles_blogs, :id => false do |t|
      t.column :article_id, :integer
      t.column :blog_id, :integer
    end
    add_index :articles_blogs, [:article_id, :blog_id] 
    add_index :articles_blogs, :blog_id
  end

  def self.down
    drop_table :articles_blogs
  end
end

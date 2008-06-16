class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :article_id, :permission, :commenter_id
      t.string  :title, :author,  :ip_address,  :email, :website
      t.text    :body,  :body_html
      t.boolean :allow_smile, :show_signature,  :default => true
      t.boolean :is_draft, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end

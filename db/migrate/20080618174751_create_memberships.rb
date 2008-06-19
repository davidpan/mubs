class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :user_id, :blog_id
      t.string  :role, :permission, :note
      t.timestamps
    end
    add_index :memberships, [:blog_id, :user_id] 
    add_index :memberships, :user_id
  end

  def self.down
    drop_table :memberships
  end
end

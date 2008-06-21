class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.string :name, :limit => 40, :default => '', :null => true
      t.string :login, :email, :crypted_password, :salt,
               :remember_token, :activation_code, :limit => 40
      t.string :state, :null => :no, :default => 'passive'
      t.string :friends_ids
      t.string :time_zone, :limit => 40, :default => 'UTC'
      t.integer :group_id,:local, :avatar_id, :blog_id
      t.datetime :activated_at, :deleted_at, :remember_token_expires_at, :last_login_at
      t.timestamps 
    end
    add_index :users, :login, :unique => true
  end

  def self.down
    drop_table :users
  end
end

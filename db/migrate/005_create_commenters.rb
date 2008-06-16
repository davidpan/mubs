class CreateCommenters < ActiveRecord::Migration
  def self.up
    create_table :commenters, :force => true do |t|
      t.string :login, :email, :remember_token
      t.string :activation_code, :crypted_password, :salt, :limit => 40
      t.string :state, :null => :no, :default => 'passive'
      t.datetime :remember_token_expires_at, :last_login_at, :activated_at, :deleted_at
      t.timestamps
    end
  end

  def self.down
    drop_table "commenters"
  end
end

class CreateOpenIds < ActiveRecord::Migration
  def self.up
    create_table :open_ids do |t|
      t.integer :user_id
      t.string  :url,     :limit => 255
      t.timestamps
    end
  end

  def self.down
    drop_table :open_ids
  end
end

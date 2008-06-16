class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name, :image, :description
      t.integer :parent_id, :tree_id, :lft, :rgt
      t.string :color, :limit => 16
      t.timestamps
    end
    add_index :categories, :name, :unique  => true
  end

  def self.down
    drop_table :categories
  end
end

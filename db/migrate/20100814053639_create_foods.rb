class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.string :display_name
      t.integer :cost
      t.float :sales_tax
      t.integer :price
      t.boolean :display
      t.timestamps
    end
  end
  
  def self.down
    drop_table :foods
  end
end

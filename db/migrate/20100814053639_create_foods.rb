class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.string :display_name
      t.decimal :cost, :precision => 10, :scale => 2
      t.float :sales_tax
      t.decimal :price, :precision => 10, :scale => 2
      t.boolean :display
      t.string :info
      t.timestamps
    end
  end
  
  def self.down
    drop_table :foods
  end
end

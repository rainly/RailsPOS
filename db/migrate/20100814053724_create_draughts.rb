class CreateDraughts < ActiveRecord::Migration
  def self.up
    create_table :draughts do |t|
      t.string :display_name
      t.string :full_name
      t.string :brewery
      t.string :country
      t.float :abv
      t.string :source
      t.float :volume
      t.string :volume_unit
      t.decimal :keg_cost, :precision => 10, :scale => 2
      t.integer :serving_size
      t.integer :small_serving_size
      t.string :glass_type
      t.string :small_glass_type
      t.float :sales_tax
      t.string :style
      t.decimal :price, :precision => 10, :scale => 2
      t.decimal :small_price, :precision => 10, :scale => 2
      t.integer :stock
      t.boolean :display
      t.string :info
      t.timestamps
    end
  end
  
  def self.down
    drop_table :draughts
  end
end

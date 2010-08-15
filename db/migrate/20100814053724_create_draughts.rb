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
      t.integer :keg_cost
      t.integer :serving_size
      t.string :glass_type
      t.float :sales_tax
      t.string :style
      t.integer :price
      t.integer :stock
      t.boolean :display
      t.timestamps
    end
  end
  
  def self.down
    drop_table :draughts
  end
end

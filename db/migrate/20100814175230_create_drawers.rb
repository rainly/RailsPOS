class CreateDrawers < ActiveRecord::Migration
  def self.up
    create_table :drawers do |t|
      t.references :user
      t.datetime :closed_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :drawers
  end
end

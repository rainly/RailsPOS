class CreateTabs < ActiveRecord::Migration
  def self.up
    create_table :tabs do |t|
      t.string :name
      t.references :user
      t.references :drawer
      t.datetime :closed_at
      t.string :type
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tabs
  end
end

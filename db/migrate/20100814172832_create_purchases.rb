class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.references :user
      t.references :tab
      t.references :purchasable, :polymorphic => true
      t.string :alteration
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :alteration_user_id
      t.boolean :ordered
      t.timestamps
    end
  end
  
  def self.down
    drop_table :purchases
  end
end

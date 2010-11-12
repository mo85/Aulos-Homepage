class CreateCart < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      
      t.timestamps
    end
    
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity
    end
  end

  def self.down
    drop_table :carts
    drop_table :cart_items
  end
end

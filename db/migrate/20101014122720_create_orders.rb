class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :street
      t.string :number
      t.integer :zip
      t.string :city
      t.string :country

      t.integer :status
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end

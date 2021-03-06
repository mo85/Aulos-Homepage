class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.string :street
      t.string :number
      t.integer :zip
      t.string :city

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end

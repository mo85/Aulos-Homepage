class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.string :email
      t.string :street
      t.integer :zip
      t.string :city
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end

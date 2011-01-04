class CreateGuestnotes < ActiveRecord::Migration
  def self.up
    create_table :guestnotes do |t|
      t.string :author
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :guestnotes
  end
end

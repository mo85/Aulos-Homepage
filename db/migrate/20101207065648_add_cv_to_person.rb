class AddCvToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :cv, :text
  end

  def self.down
    remove_column :people, :cv
  end
end

class AddFamilyToInstrument < ActiveRecord::Migration
  def self.up
    add_column :instruments, :family, :integer
  end

  def self.down
    remove_column :instruments, :family
  end
end

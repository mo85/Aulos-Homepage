class AddSoloistToMembership < ActiveRecord::Migration
  def self.up
    add_column :memberships, :soloist, :boolean, :default => false
  end

  def self.down
    remove_column :memberships, :soloist
  end
end

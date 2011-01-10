class FixSoloist < ActiveRecord::Migration
  def self.up
    remove_column :memberships, :soloist
    add_column :plays, :soloist_id, :integer
  end

  def self.down
    add_column :memberships, :soloist, :boolean, :default => false
    remove_column :plays, :soloist_id
  end
end

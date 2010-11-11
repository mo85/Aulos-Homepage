class RenameStatus < ActiveRecord::Migration
  def self.up
    rename_column :orders, :status, :state
  end

  def self.down
    rename_column :orders, :state, :status
  end
end

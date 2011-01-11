class AddPlayPositionToParts < ActiveRecord::Migration
  def self.up
    add_column :parts, :play_position, :integer, :default => 999
  end

  def self.down
    remove_column :parts, :play_position
  end
end

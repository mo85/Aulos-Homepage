class AddProgramPositionToPlays < ActiveRecord::Migration
  def self.up
    add_column :plays, :program_position, :integer, :default => 999
  end

  def self.down
    remove_column :plays, :program_position
  end
end

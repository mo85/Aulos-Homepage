class RenameMembershipColumn < ActiveRecord::Migration
  def self.up
    rename_column :memberships, :person_id, :instrumentalist_id
  end

  def self.down
    rename_column :memberships, :instrumentalist_id, :person_id
  end
end

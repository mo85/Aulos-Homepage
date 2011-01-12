class AddNameToAudioTrack < ActiveRecord::Migration
  def self.up
    add_column :audio_tracks, :name, :string
  end

  def self.down
    remove_column :audio_tracks, :name
  end
end

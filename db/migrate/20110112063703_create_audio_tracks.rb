class CreateAudioTracks < ActiveRecord::Migration
  def self.up
    create_table :audio_tracks do |t|
      t.integer :project_id
      
      t.string :file_file_name
      t.string :file_content_type
      t.string :file_file_size
      t.datetime :file_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :audio_tracks
  end
end

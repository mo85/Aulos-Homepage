class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.text :note
      t.integer :location_id
      t.string :type
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

class CreatePlays < ActiveRecord::Migration
  def self.up
    create_table :plays do |t|
      t.string    :title
      t.integer   :year
      t.integer   :project_id
      t.integer   :composer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :plays
  end
end

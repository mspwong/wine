class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags, :force=>true do |t|
      t.string :name
      t.references :wine, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end

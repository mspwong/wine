class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs, :force=>true do |t|
      t.string "name", :null=>false
      t.timestamps :null=>false
    end
  end

  def self.down
    drop_table :programs
  end
end

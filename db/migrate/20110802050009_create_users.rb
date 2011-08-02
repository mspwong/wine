class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :force=>true do |t|
      t.integer "id", :null=>false
      t.string "name", :null=>false
      t.string "email"
      t.timestamps :null=>false
    end
  end

  def self.down
    drop_table :users
  end
end

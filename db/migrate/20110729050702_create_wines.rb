class CreateWines < ActiveRecord::Migration
  def self.up
    create_table :wines, :force=>true do |t|
      t.integer "id", :null=>false
      t.string "name", :null=>false
      t.string "varietal"
      t.integer "vintage"
      t.string "region"
      t.integer "item_no", :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :wines
  end
end

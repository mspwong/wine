class CreateWines < ActiveRecord::Migration
  def self.up
    create_table :wines, :force=>true do |t|
      t.string "name", :null=>false
      t.string "varietal"
      t.integer "vintage"
      t.string "region"
      t.integer "item_no", :null=>false
      t.timestamps :null=>false
    end
    add_index :wines, [:name], :unique=>true
  end

  def self.down
    remove_index :wines, :name
    drop_table :wines
  end
end

class AddActiveToWines < ActiveRecord::Migration
  def self.up
    add_column :wines, :active, :boolean, :default => true
    Wine.update_all ["active = ?", true]
  end

  def self.down
    remove_column :wines, :active
  end
end

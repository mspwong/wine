class AddActiveToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :active, :boolean, :default=>true
    Review.update_all ["active = ?", true]
  end

  def self.down
    remove_column :reviews, :active
  end
end

class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews, :force=>true do |t|
      t.references :user, :null=>false
      t.text :body
      t.references :wine, :null=>false
      t.timestamps :null=>false
    end
  end

  def self.down
    drop_table :reviews
  end
end

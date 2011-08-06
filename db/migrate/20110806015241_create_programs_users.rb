class CreateProgramsUsers < ActiveRecord::Migration
  def self.up
    create_table :programs_users, :id => false do |t|
      t.belongs_to :program
      t.belongs_to :user
      t.timestamps :null=>false
    end
  end

  def self.down
    drop_table :programs_users
  end
end

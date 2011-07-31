class Wine < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, :maximum => 30
  validates_numericality_of :vintage, :only_integer => true, :allow_nil => true
  validates_presence_of :item_no
  validates_numericality_of :item_no, :only_integer => true

  has_many :reviews
end

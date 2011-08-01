# == Schema Information
# Schema version: 20110731053333
#
# Table name: wines
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  varietal   :string(255)
#  vintage    :integer(4)
#  region     :string(255)
#  item_no    :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Wine < ActiveRecord::Base
  has_many :reviews
  has_many :tags

  validates_presence_of :name
  validates_length_of :name, :maximum => 30
  validates_numericality_of :vintage, :only_integer => true, :allow_nil => true
  validates_presence_of :item_no
  validates_numericality_of :item_no, :only_integer => true
  validates_associated :reviews
  validates_associated :tags

  accepts_nested_attributes_for :tags, :allow_destroy => true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? }}

end

# == Schema Information
# Schema version: 20110802051535
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  has_many :reviews

  validates_length_of :name, :maximum => 50

end

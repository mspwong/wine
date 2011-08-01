# == Schema Information
# Schema version: 20110731053333
#
# Table name: reviews
#
#  id         :integer(4)      not null, primary key
#  reviewer   :string(255)     not null
#  body       :text
#  wine_id    :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Review < ActiveRecord::Base
  validates_presence_of :reviewer
  validates_length_of :reviewer, :maximum => 50
  validates_length_of :body, :maximum => 500

  belongs_to :wine
end

# == Schema Information
# Schema version: 20110802051535
#
# Table name: reviews
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)      not null
#  body       :text
#  wine_id    :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Review < ActiveRecord::Base
  #has_one :user
  belongs_to :user
  belongs_to :wine

  validates_presence_of :body
  validates_length_of :body, :maximum => 500
  validates_exclusion_of :body, :in => %w(shit fuck), :message => "must not contained foul words"
  validates_each :body do |model, attr, value|
    model.errors.add(attr, 'must not be foul phases') if value.include? 'fucking bad'
  end
end

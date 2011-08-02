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

require "ap"

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :wine

  validates_presence_of :body
  validates_length_of :body, :maximum => 100
  validates_exclusion_of :body, :in => %w(shit fuck), :message => "must not contained foul words"
  validates_each :body do |model, attr, value|
    model.errors.add(attr, 'must not be foul phases') if value && (value.include? 'fucking bad')
    model.errors.add_to_base("This review is no good.  Please start over.") if !model.errors.blank?
    ap "*****************************************************************************"
    ap model.errors.full_messages if !model.errors.blank?
    ap "*****************************************************************************"
  end
end

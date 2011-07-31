class Review < ActiveRecord::Base
  validates_presence_of :reviewer
  validates_length_of :reviewer, :maximum => 50
  validates_length_of :body, :maximum => 500

  belongs_to :wine
end

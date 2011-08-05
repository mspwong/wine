require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  should_belong_to :wine
  should_belong_to :reviewer
  should_validate_presence_of :wine
  should_validate_presence_of :reviewer

  context "Saving a new review" do
    context "without a body" do
      should "be persist the review" do
        review = Review.new(:wine => wines(:primus), :reviewer => users(:parker))
        assert review.save
      end
    end

    context "with censored words" do
      should "not persist the review" do
        assert Review.create(:wine => wines(:primus), :reviewer => users(:parker), :body => "fuck").new_record?
        assert Review.create(:wine => wines(:primus), :reviewer => users(:parker), :body => "shit").new_record?
        assert Review.create(:wine => wines(:primus), :reviewer => users(:parker), :body => "SHIT").new_record?
        assert Review.create(:wine => wines(:primus), :reviewer => users(:parker), :body => "fucking").new_record?
        assert Review.create(:wine => wines(:primus), :reviewer => users(:parker), :body => "shitty").new_record?
        assert Review.create(:wine => wines(:primus), :reviewer => users(:parker), :body => "Shitty").new_record?
        assert Review.create(:wine => wines(:primus), :reviewer => users(:parker), :body => "shiTTy").new_record?
        assert Review.create(:wine => wines(:primus), :reviewer => users(:parker), :body => "Wine is shitty").new_record?
        assert Review.create(:wine => wines(:primus), :reviewer => users(:parker), :body => "Wine is fuckingshitty").new_record?
      end
    end

    context "with valid info" do
      should "be persist the review" do
        review = Review.new(:wine => wines(:primus), :reviewer => users(:parker), :body => "This is an excellent wine.")
        assert review.save
      end
    end
  end


end
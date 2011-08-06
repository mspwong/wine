require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:wine_spectator)
  end
  subject { @user }

  should_have_many :reviews
  should_have_many :wines
  should_have_and_belong_to_many :programs

  context "Validating a valid user" do
    should "validate" do
      assert_valid User.new(:name => "test name")
      assert_valid User.new(:name => "12345678901234567890123456789012345678901234567890")
    end
  end

  context "Validating an invalid user" do
    should "raise AssertionFailedError" do
      assert_raise(Test::Unit::AssertionFailedError) { assert_valid User.new() }
      assert_raise(Test::Unit::AssertionFailedError) { assert_valid User.new(:name => "123456789012345678901234567890123456789012345678901") }
    end
  end

  context "Finding user's reviews" do
    should "exclude reviews that are inactive" do
      assert @user.reviews.first.active

      assert_difference '@user.reviews.size', -1 do
        @user.reviews.first.update_attribute(:active, false)
      end
    end
  end

  context "Updating user" do
    should "synchronize its reviews status" do
      setup do
        assert @user.active
        @user.reviews.each { |r| assert r.active }
      end

      assert_no_difference '@user.reviews.size' do
        @user.update_attribute(:active, false)
      end
      assert !@user.active
      @user.reviews.each { |r| assert !r.active }
    end
  end

  context "Given a user" do
    should "be able to navigate to the wines it reviewed" do
      assert_equal 2, @user.wines.size
    end
  end

  context "Given a user" do
    should "be able to navigate to the programs it belongs to" do
      assert_equal 2, @user.programs.size

      parker = users(:parker)
      assert_equal 0, parker.programs.size
    end
  end

end
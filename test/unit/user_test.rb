require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:wine_spectator)
  end
  subject { @user }

  should_have_many :reviews

  context "Validate a valid user" do
    should "validate" do
      assert_valid User.new(:name => "test name")
      assert_valid User.new(:name => "12345678901234567890123456789012345678901234567890")
    end
  end

  context "Validate an invalid user" do
    should "raise AssertionFailedError" do
      assert_raise(Test::Unit::AssertionFailedError) { assert_valid User.new() }
      assert_raise(Test::Unit::AssertionFailedError) { assert_valid User.new(:name => "123456789012345678901234567890123456789012345678901") }
    end
  end

  test "find user's reviews excludes reviews that are inactive'" do
    assert_equal 2, @user.reviews.size
    assert @user.reviews.first.active

    @user.reviews.first.update_attribute(:active, false)
    @user.reload
    assert_equal 1, @user.reviews.size
  end

  test "update user synchronizes its reviews status" do
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
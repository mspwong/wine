require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:wine_spectator)
  end

  test "validate valid user" do
    assert_valid User.new(:name => "test name")
    assert_valid User.new(:name => "12345678901234567890123456789012345678901234567890")
  end

  test "validate invalid user" do
    assert_raise(Test::Unit::AssertionFailedError) { assert_valid User.new() }
    assert_raise(Test::Unit::AssertionFailedError) { assert_valid User.new(:name => "123456789012345678901234567890123456789012345678901") }
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
      assert_equal 2, @user.reviews.size
      @user.reviews.each { |r| assert r.active }
    end

    @user.update_attribute(:active, false)
    assert !@user.active
    assert_equal 2, @user.reviews.size
    @user.reviews.each { |r| assert !r.active }
  end

end
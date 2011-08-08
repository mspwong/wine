require "test_helper"

class FixnumTest < ActiveSupport::TestCase

  context "calling closest_fibonacci_smaller_or_equal_to on a positive integer or zero" do
    should "return the correct value" do
      assert_equal 3, 4.closest_fibonacci_smaller_or_equal_to
      assert_equal 0, 0.closest_fibonacci_smaller_or_equal_to
      assert_equal 1, 1.closest_fibonacci_smaller_or_equal_to
    end
  end

  context "Fixnum types" do
    should "retain their base operations" do
      assert Fixnum, 4.class
      assert_equal "4", 4.to_s
      assert_equal 99, -99.abs
    end
  end

  context "calling closest_fibonacci_smaller_or_equal_to on a non-integer" do
    should "throw exception" do
      assert_raise(NoMethodError) { 0.5.closest_fibonacci_smaller_or_equal_to }
      assert_raise(NoMethodError) { 4.5.closest_fibonacci_smaller_or_equal_to }
    end
  end
end
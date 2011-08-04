require "test_helper"

class UtilTest < ActiveSupport::TestCase

  test "for a negative number" do
    assert_raise(RuntimeError) { Util.closest_fibonacci_smaller_or_equal_to(-1) }
    assert_raise(RuntimeError) { Util.closest_fibonacci_smaller_or_equal_to(-0.5) }
  end

  test "for a positive non-interger" do
    assert_raise(RuntimeError) { Util.closest_fibonacci_smaller_or_equal_to(0.5) }
    assert_raise(RuntimeError) { Util.closest_fibonacci_smaller_or_equal_to(4.5) }
  end

  test "for a non-negative integer" do
    assert_equal 0, Util.closest_fibonacci_smaller_or_equal_to(0)
    assert_equal 1, Util.closest_fibonacci_smaller_or_equal_to(1)
    assert_equal 2, Util.closest_fibonacci_smaller_or_equal_to(2)
    assert_equal 3, Util.closest_fibonacci_smaller_or_equal_to(3)
    assert_equal 3, Util.closest_fibonacci_smaller_or_equal_to(4)
    assert_equal 5, Util.closest_fibonacci_smaller_or_equal_to(5)
    assert_equal 5, Util.closest_fibonacci_smaller_or_equal_to(6)
    assert_equal 5, Util.closest_fibonacci_smaller_or_equal_to(7)
    assert_equal 8, Util.closest_fibonacci_smaller_or_equal_to(8)
    assert_equal 8, Util.closest_fibonacci_smaller_or_equal_to(9)
    assert_equal 8, Util.closest_fibonacci_smaller_or_equal_to(10)
    assert_equal 8, Util.closest_fibonacci_smaller_or_equal_to(11)
    assert_equal 8, Util.closest_fibonacci_smaller_or_equal_to(12)
    assert_equal 13, Util.closest_fibonacci_smaller_or_equal_to(13)
    assert_equal 13, Util.closest_fibonacci_smaller_or_equal_to(14)
    assert_equal 13, Util.closest_fibonacci_smaller_or_equal_to(15)
    assert_equal 63245986, Util.closest_fibonacci_smaller_or_equal_to(99999999)
  end
end
require "test_helper"

class IntegerTest < ActiveSupport::TestCase

  context "calling closest_fibonacci_smaller_or_equal_to on a non-integer" do
    should "throw exception" do
      assert_raise(NoMethodError) { 0.5.closest_fibonacci_smaller_or_equal_to }
      assert_raise(NoMethodError) { 4.5.closest_fibonacci_smaller_or_equal_to }
      assert_raise(NoMethodError) { -0.5.closest_fibonacci_smaller_or_equal_to }
    end
  end

  context "calling closest_fibonacci_smaller_or_equal_to on a negative integer" do
    should "throw exception" do
      assert_raise(RuntimeError) { -1.closest_fibonacci_smaller_or_equal_to }
    end
  end

  context "regression testing:  " do
    context "an integer/fixnum/bignum" do
      should "retain its standard library behavior" do
        assert 4.is_a?(Integer)
        assert 4.integer?
        assert 4 == 4
        assert 4.eql?(4)
        four = 4
        assert 4 == four
        assert 4.eql?(four)
        assert 4 == 4.0
        assert !4.eql?(4.0)
        assert 3 < 4
        assert_equal 4, 4.round
        assert_equal 4, 4.ceil
        assert_equal 1, 4.modulo(3)
        assert_equal "4", 4.to_s
        assert_equal 99, -99.abs
        assert 88.even?
        assert !89.even?
        assert !88.odd?
        assert 89.odd?
        assert -88.even?
        assert !-88.odd?

        test_fixnum = 99999999
        assert_equal Fixnum, test_fixnum.class
        assert test_fixnum.is_a?(Integer)
        assert test_fixnum.is_a?(Fixnum)
        assert_not_nil test_fixnum.hash
        test_bignum = 999999999999999999999999999999
        assert_equal Bignum, test_bignum.class
        assert test_bignum.is_a?(Integer)
        assert test_bignum.is_a?(Bignum)
        assert_not_nil test_bignum.hash
        assert Time.now.to_i.is_a?(Integer)
      end
    end

    context "a non-integer" do
      should "not have access to integer methods" do
        assert !0.5.integer?
        assert_raise(NoMethodError) { 0.5.even? }
        assert_raise(NoMethodError) { 0.5.times { |i| puts "does not matter" } }
      end
    end
  end

  context "calling closest_fibonacci_smaller_or_equal_to on a positive integer or zero" do
    should "return the correct value" do
      assert_equal 0, 0.closest_fibonacci_smaller_or_equal_to
      assert_equal 1, 1.closest_fibonacci_smaller_or_equal_to
      assert_equal 2, 2.closest_fibonacci_smaller_or_equal_to
      assert_equal 3, 3.closest_fibonacci_smaller_or_equal_to
      assert_equal 3, 3.closest_fibonacci_smaller_or_equal_to
      assert_equal 5, 5.closest_fibonacci_smaller_or_equal_to
      assert_equal 5, 6.closest_fibonacci_smaller_or_equal_to
      assert_equal 5, 7.closest_fibonacci_smaller_or_equal_to
      assert_equal 8, 8.closest_fibonacci_smaller_or_equal_to
      assert_equal 8, 9.closest_fibonacci_smaller_or_equal_to
      assert_equal 8, 10.closest_fibonacci_smaller_or_equal_to
      assert_equal 8, 11.closest_fibonacci_smaller_or_equal_to
      assert_equal 8, 12.closest_fibonacci_smaller_or_equal_to
      assert_equal 13, 13.closest_fibonacci_smaller_or_equal_to
      assert_equal 13, 14.closest_fibonacci_smaller_or_equal_to
      assert_equal 13, 15.closest_fibonacci_smaller_or_equal_to
      assert_equal 13, 15.closest_fibonacci_smaller_or_equal_to
      assert_equal 13, 20.closest_fibonacci_smaller_or_equal_to
      assert_equal 21, 21.closest_fibonacci_smaller_or_equal_to
      test_fixnum = 99999999
      assert test_fixnum.is_a?(Fixnum)
      assert !test_fixnum.is_a?(Bignum)
      assert_equal 63245986, test_fixnum.closest_fibonacci_smaller_or_equal_to
      test_bignum = 999999999999999999999999999999
      assert !test_bignum.is_a?(Fixnum)
      assert test_bignum.is_a?(Bignum)
      assert_not_nil test_bignum.closest_fibonacci_smaller_or_equal_to

      assert_not_nil Time.now.to_i.closest_fibonacci_smaller_or_equal_to
    end
  end

end
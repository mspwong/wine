class Fixnum
  def closest_fibonacci_smaller_or_equal_to

    raise "undefined method 'closest_fibonacci_smaller_or_equal_to' for '#{self.to_s}':'#{self.class}'" unless self.class == Integer
    raise "method 'closest_fibonacci_smaller_or_equal_to' is not available for non-positive integers" if !self.is_a?(Integer) || self < 0

    sequence = [0, 1]
    sequence << sequence[sequence.size-2] + sequence.last while sequence.last <= self

    sequence[sequence.size-2]
  end

end
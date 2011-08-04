class Util

  def self.closest_fibonacci(input)
    raise "number must be a positive integer" unless input.is_a?(Integer) && input > 0
    return input if input <= 1

    sequence = [0, 1]
    sequence << sequence[sequence.size-2] + sequence.last while sequence.last <= input

    sequence[sequence.size-2]
  end
end
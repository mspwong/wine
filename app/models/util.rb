class Util

  def self.fibonacci(input)
    return input if input <= 1

    sequence = [0, 1]
    sequence << sequence[sequence.size-2] + sequence.last while sequence.last <= input

    sequence[sequence.size-2]
  end
end
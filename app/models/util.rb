class Util

  def self.fibonacci(input)
    sequence = [0, 1]

    return input if input <= 1

    while sequence.last <= input
      sequence[sequence.size] = sequence[sequence.size-2] + sequence.last
    end

    sequence[sequence.size-2]

  end
end
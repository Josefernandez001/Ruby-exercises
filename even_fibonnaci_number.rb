# frozen_string_literal: true

# class fibonnaci
class Fibonnaci
  @accumulator = 0
  @increaser = 1
  @even_sum = 0
  def self.fibonacci_pair_sum(limit)
    if limit.is_a? Integer
      while @accumulator < limit
        @accumulator, @increaser = @increaser, @accumulator + @increaser
        @even_sum += @increaser if @increaser.even?
      end
      "the sum is  : #{@even_sum}"
    else
      'the limit must be an integer'
    end
  end
end
puts Fibonnaci.fibonacci_pair_sum(400_000_000)

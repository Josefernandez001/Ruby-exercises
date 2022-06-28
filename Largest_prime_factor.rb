# frozen_string_literal: true

# class factors
class Factors
  def self.highest_prime_factor(number)
    @prime_factor = 0
    @increaser = 2
    if number.is_a? Integer
      while number != 1
        @prime_factor = @increaser if @increaser > @prime_factor
        (number % @increaser).zero? ? number /= @increaser : @increaser += 1
      end
      "the largest prime factor is: #{@prime_factor}"
    else
      'the number must be an integer'
    end
  end
end

puts Factors.highest_prime_factor(600_851_475_143)
puts Factors.highest_prime_factor(90)
puts Factors.highest_prime_factor(12)

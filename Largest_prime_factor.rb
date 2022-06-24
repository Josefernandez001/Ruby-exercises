class Factors
  def self.highest_prime_factor(number)
    @prime_factor = 0

    @increaser = 2
    if number.is_a? Integer
      while number != 1
        if number % @increaser == 0
          @prime_factor = @increaser if @increaser > @prime_factor 
          number = number /@increaser
        else
          @increaser += 1
        end
      end
      "the largest prime factor is: #{@prime_factor}"
    else
      "the number must be an integer"
    end

  end
end
puts Factors.highest_prime_factor(600851475143)
puts Factors.highest_prime_factor(90)
puts Factors.highest_prime_factor(12)
class Factors
  def self.highest_prime_factor(number)
    @prime_factor = 0

    @increaser = 2

    while number != 1
      if number % @increaser == 0
        @prime_factor = @increaser if @increaser > @prime_factor 
        number = number /@increaser
      else
        @increaser += 1
      end
    end
    puts "the largest prime factor is: #{@prime_factor}"

  end
end
Factors.highest_prime_factor(600851475143)

number = 600851475143
highest_prime_factor = 0

increaser = 2

while number != 1
  if number % increaser == 0
    highest_prime_factor = increaser if increaser > highest_prime_factor 
    number = number /increaser
  else
    increaser += 1
  end
end
puts "the largest prime factor is: #{highest_prime_factor}"

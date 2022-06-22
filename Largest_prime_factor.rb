
number = 600851475143
highest_prime_factor = 0

x = 2

while number != 1
  if number % x == 0
    highest_prime_factor = x if x > highest_prime_factor 
    number = number / x
  else
    x += 1
  end
end
puts "the largest prime factor is: #{highest_prime_factor}"

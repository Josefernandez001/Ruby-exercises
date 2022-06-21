require 'Prime'

prime_number_list = Prime.first 10001
prime_number_10001st = prime_number_list[-1]
puts "the 10001st prime is #{prime_number_10001st}"

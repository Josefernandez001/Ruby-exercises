require 'Prime'

class Numbers
    def self.nth_prime_number(number)
        prime_number_list = Prime.first number
        prime_number_10001st = prime_number_list[-1]
        puts "the #{number}st prime is #{prime_number_10001st}"
    end
end

Numbers.nth_prime_number(10001)
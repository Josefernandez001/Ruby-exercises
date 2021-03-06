# frozen_string_literal: true

require 'Prime'

# class numbers
class Numbers
  def self.nth_prime_number(number)
    if number.is_a? Integer
      prime_number_list = Prime.first number
      prime_number_10001st = prime_number_list[-1]
      "the #{number}st prime is #{prime_number_10001st}"
    else
      'the number must be an integer'
    end
  end
end

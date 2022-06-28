# frozen_string_literal: true

# class palindrome
class Palindrome
  @x = 0
  @y1 = 0
  @greater_palindrome = 0
  def self.greater_palindrome_product
    111.upto(999) do |factor|
      111.upto(999) do |multiplier|
        product = factor * multiplier
        if product.to_s.eql?(product.to_s.reverse) && product > @greater_palindrome
          @greater_palindrome = product
          @x = factor
          @y1 = multiplier
        end
        next
      end
    end
    "the palindrome product is  #{@greater_palindrome} = #{@x}x#{@y1}"
  end
end

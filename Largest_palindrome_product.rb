class Palindrome
    def self.greater_palindrome_product()
        @x = 0
        @y1 = 0 
        @greater_palindrome = 0
        111.upto(999) do |factor|
            111.upto(999) do |multiplier|
                product = factor * multiplier
                product_reversed= product.to_s.reverse
                if product.to_s.eql?(product_reversed)
                    @greater_palindrome , @x, @y1 = product ,factor,multiplier if product > @greater_palindrome
                end
            end
        end
        "the palindrome product is  #{@greater_palindrome} = #{@x}x#{@y1}"

    end
end


#to save the multiplication that gives the product palindrome
x = 0
y1 = 0 
greater_palindrome = 0
111.upto(999) do |i|
    111.upto(999) do |y|
        product = i * y
        product_reversed= product.to_s.reverse
        if product.to_s.eql?(product_reversed)
            greater_palindrome , x, y1 = product ,i,y if product > greater_palindrome
        end
    end
end
puts "the palindrome product is  #{greater_palindrome} = #{x}x#{y1}"
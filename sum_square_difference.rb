class Squares
    def self.difference_sum_of_squares
        sum_squares = 0 
        sum_natural_numbers = 0 
        
        1.upto(100) do |number|
            sum_squares += number ** 2 
            sum_natural_numbers += number
        end
        difference =  (sum_natural_numbers ** 2) - sum_squares 
        "the difference is : #{difference}" 
    end
end
puts Squares.difference_sum_of_squares()    
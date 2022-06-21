sum_squares = 0 
sum_natural_numbers = 0 

1.upto(100) do |number|
    sum_squares += number ** 2 
    sum_natural_numbers += number
end
difference =  (sum_natural_numbers ** 2) - sum_squares 
puts "the difference is : #{difference}" 
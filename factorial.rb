#factorial number
#to accumulate the sequence of the factorial and the result

factorial = 1
sequence = ""

#asking for the number, to calculate the factorial

puts "type a number : "
number = gets.chomp.to_i

#by decreasing the number to 1
number.downto(1) do |n| 
  # accumulating the result of the factorial * n 
  factorial *= n 
  # accumulating the value of n
  sequence  += "#{n}"
  #checking that n is greater than 1 so that it does not put an x after the 1
  sequence  += "x" if n >1

end

#printing of the sequence and factorial
puts " #{sequence} = #{factorial}"

factorial = 1
sequence = ""

puts "type a number : "
number = gets.chomp.to_i

number.downto(1) do |n| 
  factorial *= n 
  sequence  += "#{n}"
  sequence  += "x" if n >1
end

puts " #{sequence} = #{factorial}"

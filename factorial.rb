#factorial de un  numero 
puts "numero : "
v2= gets.chomp.to_i
factorial=1
secuencia = ""
v2.downto(1) do |n| 
  factorial *= n 
  secuencia  += "#{n}"
  secuencia  += "x" if n >1
end
puts " #{secuencia} = #{factorial}"

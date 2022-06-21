sum_multiples_3_5 = 1

1.upto(999) do |i|
    sum_multiples_3_5 += i if i % 3 == 0 || i % 5 == 0
end

puts "la suma de los multiplos de 3 y 5 es : #{sum_multiples_3_5}"

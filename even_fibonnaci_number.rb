#these variables are for starting the sequence and incrementing it
a=0
b=1
even_sum=0

while a < 400000000
    a,b=b,a+b
  if a % 2 == 0 
    even_sum += a
  end
end
puts ""
puts "la suma es : #{even_sum}"
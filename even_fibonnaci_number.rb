#these variables are for starting the sequence and incrementing it
accumulator = 0
increaser = 1
even_sum = 0

while accumulator < 400000000
    accumulator , increaser = increaser, accumulator + increaser
  if increaser % 2 == 0 
    even_sum += increaser
  end
end
puts ""
puts "the sum is  : #{even_sum}"

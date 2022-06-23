class Fibonnaci 
  @accumulator = 0
  @increaser = 1
  @even_sum = 0
  def self.fibonacci_pair_sum(limit)
    while @accumulator < limit
        @accumulator , @increaser = @increaser, @accumulator + @increaser
        if @increaser % 2 == 0 
            @even_sum += @increaser
        end
    end
    puts ""
    puts "the sum is  : #{@even_sum}"
  end
end
Fibonnaci.fibonacci_pair_sum(400000000)

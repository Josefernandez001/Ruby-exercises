class Factorial
  def self.print_sequence(limit)
      @factorial = 1
      @sequence = ""
      limit.downto(1) do |n| 
        @factorial *= n 
        @sequence  += "#{n}"
        @sequence  += "x" if n >1
      end
      puts " #{@sequence} = #{@factorial}"
  end
end

Factorial.print_sequence(10)
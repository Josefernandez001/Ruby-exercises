class Factorial
  def self.print_sequence(limit)
      @factorial = 1
      @sequence = ""
      if limit.is_a? Integer 
        limit.downto(1) do |n| 
          @factorial *= n 
          @sequence  += "#{n}"
          @sequence  += "x" if n >1
        end
        " #{@sequence} = #{@factorial}"
      else
        "the limit must be an integer"
      end
  end
end
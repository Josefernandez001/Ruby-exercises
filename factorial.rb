# frozen_string_literal: true

# class factorial
class Factorial
  @sequence = ''
  @factorial = 1
  def self.print_sequence(limit)
    if limit.is_a? Integer
      limit.downto(1) do |n|
        @factorial *= n
        @sequence  += n.to_s
        @sequence  += 'x' if n > 1
      end
      " #{@sequence} = #{@factorial}"
    else
      'the limit must be an integer'
    end
  end
end

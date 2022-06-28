# frozen_string_literal: true

# class multiples
class Multiples
  def self.sum_multiples3and5(limit)
    @sum_multiples = 1
    if limit.is_a? Integer
      1.upto(limit) do |i|
        @sum_multiples += i if (i % 3).zero? || (i % 5).zero?
      end
      "the sum of the multiples 3 and 5 is : #{@sum_multiples} when the limit is #{limit}"
    else
      'the limit must be an integer'
    end
  end
end

puts Multiples.sum_multiples3and5(999)
puts Multiples.sum_multiples3and5(400)
puts Multiples.sum_multiples3and5(12)

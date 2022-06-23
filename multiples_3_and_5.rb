class Multiples
    def self.sum_multiples_3_and_5(limit)
        @sum_multiples = 1
        1.upto(limit) do |i|
            @sum_multiples += i if i % 3 == 0 || i % 5 == 0
        end
        puts "la suma de los multiplos de 3 y 5 es : #{@sum_multiples}"
    end
end

Multiples.sum_multiples_3_and_5(999)
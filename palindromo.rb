class Palindrome
    def self.palindrome_word(word)
        word_backwards = word.reverse
        
        puts message =  if word.eql?(word_backwards)
            "la palabra '#{word}' es palindromo"
        else  
            "la palabra #{word} no es palindromo "
        end
    end
end

Palindrome.palindrome_word("paap")
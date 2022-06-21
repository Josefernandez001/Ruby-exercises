print  "enter a word: "
word = gets.chomp


word_backwards = word.reverse

puts message =  if word.eql?(word_backwards)
    "la palabra '#{word}' es palindromo"
else  
    "la palabra #{word} no es palindromo "
end

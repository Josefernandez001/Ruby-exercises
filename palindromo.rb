print  "Digite una palabra: "
palabra = gets.chomp
# esto de aqui es mas que todo por si se digita una frase palindroma 
#por ejemplo  = dabale arroz a la zorra el abad
#con el split las divido y las alamceno en un arreglo
palabras = palabra.split(" ")
#y con el join las uno todas en una sola
palabras_unidas =palabras.join("")
palabras_reverse = palabras_unidas.reverse
puts  mensaje = if palabras_unidas.eql?(palabras_reverse) then "la palabra '#{palabra}' es palindromo" else  "la palabra #{palabra} no es palindromo "end

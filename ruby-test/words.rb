# frozen_string_literal: true

# class Words
class Words
  def anagram
    word_indexes = {}
    lines = read_file
    sorted_list = sort_word_list(lines)

    sorted_list.each_with_index do |word, index|
      if word_indexes[word].nil?.eql?(false)
        word_indexes[word] << lines[index]
      else
        word_indexes[word] = [lines[index]]
      end
    end

    anagrams_list = []
    word_indexes.each_value do |value|
      puts "the word #{value[0]} has anagram : #{value[0]} => #{value[1..]}"if value.length >1
      anagrams_list << "the word #{value[0]} has anagram : #{value[0]} => #{value[1..]}" if value.length > 1
    end
    anagrams_list.length
  end

  def anagramas
    word_indexes = {}
    lines = read_file
    sorted_list = sort_word_list(lines)
    sorted_list.each_with_index do |word, index|
      if word_indexes[word].nil?.eql?(false)
        word_indexes[word] << lines[index]
      else
        word_indexes[word] = [lines[index]]
      end
    end
    list_without_anagrams = []
    word_indexes.each_value do |value|
      list_without_anagrams << value[0] if value.length < 2
    end
    puts "this words has not anagrams #{list_without_anagrams}"
    list_without_anagrams.length
  end

  def search_anagram(word)
    anagram_hash = {}
    lines = read_file
    delimited_words = comparison_list(word.length, lines)
    delimited_words.each do |word_to_compare|
      next if word.eql?(word_to_compare)

      word_list = anagram_hash[word].nil?.eql?(false) ? anagram_hash[word] : []
      flag = word.downcase.chars.sort.join.eql?(word_to_compare.downcase.chars.sort.join)
      flag && word_list.include?(word_to_compare).eql?(false) ? word_list << word_to_compare : next
      anagram_hash[word] = word_list
    end
    message = anagram_hash[word].nil?.eql?(false) ? "has anagrams #{anagram_hash[word]}" : "#{word} has no anagrams"
    puts message
    message
  end
end

# same class "word" but this have new methods
class Words
  def sort_word_list(list)
    sorted_list = []
    list.each do |word|
      sorted_list << word.downcase.chars.sort.join
    end
    sorted_list
  end

  def read_file
    file = File.read('../words.txt').split("\n")
    file
  end

  def comparison_list(size, lista)
    listatall = []
    lista.each do |word|
      listatall << word if word.length == size
    end
    listatall
  end
end

word = Words.new
word.anagram()
word.anagramas()
word.search_anagram("loop")

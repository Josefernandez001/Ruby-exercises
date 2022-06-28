# frozen_string_literal: true

# class palidnrome
class Palindrome
  def self.palindrome_word(word)
    if word.is_a? String
      if word.eql?(word.reverse)
        "the word '#{word}' is palindrome"
      else
        "the word '#{word}' not is palindrome"
      end
    else
      'the word must be a string'
    end
  end
end

Palindrome.palindrome_word('paap"')

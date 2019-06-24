require 'set'

class WordChainer
  def initialize(dictionary_filename)
    @dictionary = create_dictionary(dictionary_filename)
    p adjacent_words("cat")
  end

  def create_dictionary(filename)
    dictionary = Set.new

    File.foreach(File.dirname(__FILE__) + '/' + filename) do |word|
      dictionary << word.chomp
    end

    dictionary
  end

  def adjacent_words(word)
    adjacent_words = []
    @dictionary.each do |dict_word|
      if word.length == dict_word.length && is_adjacent?(word, dict_word) && word != dict_word
        adjacent_words << dict_word
      end
    end

    adjacent_words
  end

  def is_adjacent?(word, test_word)
    (0...test_word.length).each do |i|
      word_frag = word[0...i] + word[i + 1..-1]
      test_frag = test_word[0...i] + test_word[i + 1..-1]
      return true if word_frag == test_frag
    end

    false
  end
end

WordChainer.new("dictionary.txt")

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
    same_size_words = []
    adjacent_words = []

    @dictionary.each do |dict_word|
      if word.length == dict_word.length
        same_size_words << dict_word
      end
    end

    same_size_words.each do |dict_word|
      (0...dict_word.length).each do |i|
        dict_frag = dict_word[0...i] + dict_word[i + 1..-1]
        word_frag = word[0...i] + word[i + 1..-1]
        adjacent_words << dict_word if dict_frag == word_frag && dict_word != word
      end
    end

    adjacent_words
  end
end

WordChainer.new("dictionary.txt")

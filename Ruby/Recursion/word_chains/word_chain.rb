require 'set'

class WordChainer
  def initialize(dictionary_filename)
    @dictionary = create_dictionary(dictionary_filename)
    adjacent_words("cat")
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

    @dictionary.each do |dict_word|
      if word.length == dict_word.length
        same_size_words << dict_word
      end
    end

    same_size_words
  end
end

WordChainer.new("dictionary.txt")

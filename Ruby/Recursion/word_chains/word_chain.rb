require 'set'

class WordChainer
  def initialize(dictionary_filename)
    @dictionary = create_dictionary(dictionary_filename)
    p run("test", "word")
  end

  def create_dictionary(filename)
    dictionary = Set.new

    File.foreach(File.dirname(__FILE__) + '/' + filename) do |word|
      dictionary << word.chomp
    end

    dictionary
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]

    while @current_words.any?
      explore_current_words
    end

    @all_seen_words
  end

  def explore_current_words
    new_current_words = []
    
    @current_words.each do |word|
      adjacent_words(word).each do |adjacent_word|
        next if @all_seen_words.include?(adjacent_word)

        new_current_words << adjacent_word
        @all_seen_words << adjacent_word
      end
    end

    @current_words = new_current_words
  end

  def adjacent_words(word)
    adjacent_words = []
    @dictionary.each do |dict_word|
      if word.length == dict_word.length && is_adjacent?(word, dict_word)
        adjacent_words << dict_word
      end
    end

    adjacent_words
  end

  def is_adjacent?(word, test_word)
    (0...test_word.length).each do |i|
      word_frag = word[0...i] + word[i + 1..-1]
      test_frag = test_word[0...i] + test_word[i + 1..-1]
      return true if word_frag == test_frag && word != test_word
    end

    false
  end
end

WordChainer.new("dictionary.txt")

require 'set'

class WordChainer
  def initialize(dictionary_filename)
    @dictionary = create_dictionary(dictionary_filename)
    puts "What is your starting word?"
    @source = gets.chomp
    puts "What is your target word?"
    @target = gets.chomp
    puts "Searching..."
    p run(@source, @target)
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
    @all_seen_words = { source => nil }

    while @current_words.any? && !@all_seen_words.include?(target)
      explore_current_words
    end

    build_path(target)
  end
  
  def build_path(target)
    path = [target]

    until @all_seen_words[path[0]].nil?
      previous_word = @all_seen_words[path[0]]
      path.unshift(previous_word)
    end

    path
  end

  def explore_current_words
    new_current_words = []

    @current_words.each do |word|
      adjacent_words(word).each do |adjacent_word|
        next if @all_seen_words.include?(adjacent_word)

        new_current_words << adjacent_word
        @all_seen_words[adjacent_word] = word
      end
    end

    @current_words = new_current_words
    new_current_words.each do |word|
      puts "#{@all_seen_words[word]} => #{word}"
    end
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

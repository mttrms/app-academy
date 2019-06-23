require 'set'

class WordChainer
  def initialize(dictionary_filename)
    @dictionary = create_dictionary(dictionary_filename)
  end

  def create_dictionary(filename)
    dictionary = Set.new

    File.foreach(File.dirname(__FILE__) + '/' + filename) do |word|
      dictionary << word.chomp
    end

    dictionary
  end
end

require_relative "board"

class Sudoku
  attr_reader :board

  def initialize(filename)
    @board = Board.from_file(filename)
    @pos = nil
    @value = nil
    play
  end

  def play
    until @board.solved?
      @board.render
      prompt
      fill_in(@pos, @value)
    end
    
    @board.render
    puts "Congratulations, you win!"
    sleep(10)
  end

  def prompt
    puts "What tile would you like to change? Example: 0,2"
    @pos = gets.chomp
    puts "To what value?"
    @value = gets.chomp
  end

  def fill_in(pos, val)
    position = pos.split(",").map!(&:to_i)
    @board[position].value = val.to_i
  end

end

game = Sudoku.new("sudoku2.txt")
# game.play
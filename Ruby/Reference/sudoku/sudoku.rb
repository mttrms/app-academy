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
    until valid_pos?(@pos)
      puts "What tile would you like to change? Example: 0,2"
      @pos = gets.chomp
    end

    until valid_val?(@value)
      puts "To what value?"
      @value = gets.chomp
    end
  end

  def fill_in(pos, val)
    position = pos.split(",").map!(&:to_i)
    @board[position].value = val.to_i
    @pos = nil
    @value = nil
  end

  def valid_pos?(pos)
    return false if pos == nil

    position = pos.split(",").map!(&:to_i)
    @board[position].given == false
  end

  def valid_val?(val)
    return false if val == nil || !(1..8).to_a.include?(val.to_i)

    true
  end

end

game = Sudoku.new("sudoku1_almost.txt")

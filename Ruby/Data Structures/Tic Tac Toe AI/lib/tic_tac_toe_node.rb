require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :next_mover_mark, :prev_move_pos, :board

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = nil || prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.winner != evaluator && @board.winner != nil
    return false if @board.winner == evaluator

    self.children.each do |child_node|
      result = child_node.losing_node?(evaluator)
      return result if result == true
    end

    false
  end

  def winning_node?(evaluator)
    return true if @board.winner == evaluator

    self.children.each do |child_node|
      result = child_node.winning_node?(evaluator)
      return result if result == true
    end

    false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    next_move_states = []

    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          next_move = TicTacToeNode.new(new_board, swapped_mark, pos)
          next_move_states << next_move
        end
      end
    end

    next_move_states
  end

  def swapped_mark
    if @next_mover_mark == :x
      :o
    else
      :x
    end
  end
end

game = Board.new
game_state = TicTacToeNode.new(game, :x)
p game_state.children
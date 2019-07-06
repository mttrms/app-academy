require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)

    node.children.each do |move|
      return move.prev_move_pos if move.winning_node?(mark)
    end

    node.children.each do |move|
      return move.prev_move_pos if !move.losing_node?(mark)
    end

    raise "We are going to lose!"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Matt")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end

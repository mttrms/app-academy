require_relative "game"

memory_puzzle = Game.new

until memory_puzzle.board.won?
  memory_puzzle.play
end

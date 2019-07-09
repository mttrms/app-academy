# Ruby Library Management - 3 ways to manage dependencies across files:
# require
# require_relative
# load

# lib/board.rb
class Board
  def initialize
    @grid = Array.new(10)
  end
end

# lib/game.rb
require 'board'

class Game
  def initialize
    @board = Board.new
  end
end

game = Game.new

# Require first searches $LOAD_PATH, then Gem.path for a file. The current directory
# is not part of the $LOAD_PATH.

# Use ./board.rb (search current directory)
# Or use require_relative

# "Current directory" is the directory you are running ruby from
# Often wrong to use require for an explicit path, should use require_relative

# require_relative
# Expects an explicit path, will not look in $LOAD_PATH or for gems. Will use 
# the directory of the current source file as the starting point.

# Another option; Adding a folder to the load path with -I
# $ ruby -I animal-kit/lib cat-tracker/lib/animal.rb
# Convention: $ ruby -I./animal-kit/lib cat-tracker/lib/animal.rb (leave no space between flag and folder)

# Load
# Load will read in the file every time no matter what, even if the interpreter has
# seen it already. Good for debugging. Shouldn't ever be used in actual source files.
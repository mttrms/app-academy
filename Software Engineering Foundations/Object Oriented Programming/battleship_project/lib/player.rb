class Player
  def get_move
    puts "enter a position with coordinates seprated with a space like '4 7'"
    move = gets.chomp.split(" ").map(&:to_i)
  end
end

class Tower
  attr_reader :columns

  def initialize
    @columns = [[5,4,3,2,1], [], []]
    play
  end

  def move_disc(start_idx, end_idx)
    raise "start pos is empty" if columns[start_idx].empty?
    raise "disc must move" if start_idx == end_idx
    columns[end_idx].push(columns[start_idx].pop)
  end

  def won?
    winning_order = [5,4,3,2,1]
    columns[1] == winning_order || columns[2] == winning_order
  end

  def play
    until won?
      columns.each { |col| p col}
      start_idx, end_idx = prompt
      move_disc(start_idx, end_idx)
      print `clear`
    end

    puts "You win!"
  end

  def prompt
    puts "Where should we pull from?"
    start_idx = gets.chomp.to_i
    puts "Where should we place it?"
    end_idx = gets.chomp.to_i

    [start_idx, end_idx]
  end
end

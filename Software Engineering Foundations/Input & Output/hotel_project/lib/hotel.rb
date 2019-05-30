require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    
    # Initialize new rooms and fill out @rooms
    rooms.each do |name, capacity|
      @rooms[name] = Room.new(capacity)
    end
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
      puts "sorry, room does not exist"
    elsif @rooms[room_name].add_occupant(person)
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| room.available_space > 0 }
  end

  def list_rooms
    @rooms.each do |name, room|
      puts name + room.available_space.to_s
    end
  end

end

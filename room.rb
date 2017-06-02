class Room
  attr_reader :name, :seats_available, :guests, :songs, :rental_fee

  @@rooms = []

  def initialize(name, seats_available, rental_fee)
    @@rooms << name
    @name = name
    @seats_available = seats_available
    @rental_fee = rental_fee
    @guests = []
    @songs = []
  end

  def Room.rooms
    return @@rooms
  end

  def Room.reset_rooms
    @@rooms = []
  end

  def add_song(song)
    @songs << song    
  end

  def check_in_guests(guests)
    return "No room at the inn!" if guests.count > @seats_available
    guests.map do
      |guest| @guests << guest
      @seats_available -= 1
    end
  end

  def check_out_guests(leaving_guests)
    if leaving_guests == "all"
      @guests = []
    else
      leaving_guests.each do
        |guest| @guests.delete(guest)
        @seats_available += 1
      end
    end
    # @guests = [] if leaving_guests == "all"
    # leaving_guests.each { |guest| @guests.delete(guest) } if leaving_guests != "all"
  end

end
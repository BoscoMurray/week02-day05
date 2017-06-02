class Room
  attr_reader :name, :seats, :guests, :songs

  @@rooms = []

  def initialize(name, seats)
    @name = name
    @seats = seats
    @guests = []
    @songs = []
  end

  def add_song(song)
    @songs << song    
  end

  def check_in_guests(guests)
    guests.map { |guest| @guests << guest }
  end

  def check_out_guests(leaving_guests)
    leaving_guests.each { |guest| @guests.delete(guest) }
  end

end
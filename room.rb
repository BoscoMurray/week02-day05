require('pry')

class Room
  attr_reader :name, :seats_available, :guests, :songs, :rental_fee, :room_balance

  @@rooms = []

  def initialize(name, seats_available, rental_fee)
    @@rooms << name
    @name = name
    @seats_available = seats_available
    @rental_fee = rental_fee
    @guests = []
    @songs = []
    @room_balance = 0
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

  def update_room_balance
    @room_balance += @rental_fee
  end

  def check_guest_can_pay(guest)
    return true if guest.bitcoin >= @rental_fee
  end

  def paying_guests(guests)
    paying_guests = []
    guests.map { |guest| paying_guests << guest if check_guest_can_pay(guest) }
    return paying_guests
  end

  def check_in_guests(guests)
    paying = paying_guests(guests)
    binding.pry
    return "No room at the inn!" if paying == []
    paying.map do
      |guest| @guests << guest
      @seats_available -= 1
      update_room_balance
      guest.update_bitcoin_balance(@rental_fee)
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
  end

end
require('minitest/autorun')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < MiniTest::Test

  def setup
    @guest_glen = Guest.new("Glen")
    @guest_martin = Guest.new("Martin")
    guest_tom = Guest.new("Tom")
    @guests = [@guest_glen, @guest_martin, guest_tom]
    @room_101 = Room.new("101", 1)
    @room_glencoe = Room.new("Glencoe", 5)
    @room_nevis = Room.new("Nevis", 10)
    @song_bjm = Song.new("Brian Jonestown Massacre", "Animone")
    @song_tff = Song.new("Tears for Fears", "Mad World")
    @song_cw = Song.new("Chip Wickham", "Red Planet")
    @song_hm = Song.new("Happy Mondays", "Step On")
    @room_glencoe.check_in_guests(@guests)
  end

  def test_get_room_name
    assert_equal("101", @room_101.name)
  end

  def test_get_seats
    assert_equal(1, @room_101.seats)
  end

  def test_add_song
    @room_glencoe.add_song(@song_bjm)
    assert_equal("Animone", @room_glencoe.songs[0].title)
  end

  def test_check_in_guests
    assert_equal(3, @room_glencoe.guests.count)
  end

  def test_check_out_guests
    @room_glencoe.check_out_guests([@guest_martin, @guest_glen])
    assert_equal("Tom", @room_glencoe.guests[0].name)
  end

  def test_check_seats_available
    assert_equal()
  end

end
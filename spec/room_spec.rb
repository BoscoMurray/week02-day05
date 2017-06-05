require('minitest/autorun')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < MiniTest::Test

  def setup
    Room.reset_rooms
    @song_bjm = Song.new("Brian Jonestown Massacre", "Animone")
    @song_tff = Song.new("Tears for Fears", "Mad World")
    @song_cw = Song.new("Chip Wickham", "Red Planet")
    @song_hm = Song.new("Happy Mondays", "Step On")

    @guest_glen = Guest.new("Glen", 10)
    @guest_martin = Guest.new("Martin", 100)
    @guest_tom = Guest.new("Tom", 1)
    @guest_steven = Guest.new("Steven", 2)
    @guests = [@guest_glen, @guest_martin]

    @room_glencoe = Room.new("Glencoe", 2, 2)
    @room_nevis = Room.new("Nevis", 10, 2)

    @room_glencoe.check_in_guests(@guests)
  end

  def test_room_class_returns_rooms
    assert_equal("Nevis", Room.rooms[1])
  end

  def test_reset_rooms
    Room.reset_rooms
    assert_equal([], Room.rooms)
  end

  def test_get_room_name
    assert_equal("Glencoe", @room_glencoe.name)
  end

  def test_seats_available
    assert_equal(0, @room_glencoe.seats_available)
  end

  def test_add_song
    @room_glencoe.add_song(@song_bjm)
    assert_equal("Animone", @room_glencoe.songs[0].title)
  end

  def test_get_room_balance
    assert_equal(0, @room_nevis.room_balance)
  end

  def test_update_room_balance
    assert_equal(4, @room_glencoe.room_balance)
  end

  def test_check_guest_can_pay__not_enough_bitcoins
    assert_nil(@room_nevis.check_guest_can_pay(@guest_tom))
  end

  def test_check_guest_can_pay__yes
    assert_equal(true, @room_nevis.check_guest_can_pay(@guest_martin))
  end

  def test_paying_guests
    assert_equal(2, @room_nevis.paying_guests(@guests).count)
  end

  def test_check_in_guests
    assert_equal(2, @room_glencoe.guests.count)
  end

  def test_check_in_guests__no_seats_available
    assert_equal("No room at the inn!", @room_glencoe.check_in_guests([@guest_steven]))
  end

  def test_check_out_guests__one_guest
    @room_glencoe.check_out_guests([@guest_glen])
    assert_equal("Martin", @room_glencoe.guests[0].name)
  end

  def test_check_out_guests__all
    @room_glencoe.check_out_guests("all")
    assert_equal(0, @room_glencoe.guests.count)
  end

end
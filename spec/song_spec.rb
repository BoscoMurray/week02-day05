require('minitest/autorun')
require_relative('../song')

class TestSong < MiniTest::Test

  def setup
    @song_bjm = Song.new("Brian Jonestown Massacre", "Animone")
    @song_tff = Song.new("Tears for Fears", "Mad World")
  end

  def test_get_artist
    assert_equal("Brian Jonestown Massacre", @song_bjm.artist)
  end

  def test_get_song_title
    assert_equal("Animone", @song_bjm.title)
  end

end
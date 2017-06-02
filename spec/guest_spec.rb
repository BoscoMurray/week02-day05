require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test

  def setup
    @guest_glen = Guest.new("Glen")
  end

  def test_get_name
    assert_equal("Glen", @guest_glen.name)
  end

end
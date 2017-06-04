require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test

  def setup
    @guest_glen = Guest.new("Glen", 10)
  end

  def test_get_name
    assert_equal("Glen", @guest_glen.name)
  end

  def test_get_bitcoin_balance
    assert_equal(10, @guest_glen.bitcoin)
  end

  def test_update_bitcoin_balance
    @guest_glen.update_bitcoin_balance(2)
    assert_equal(8, @guest_glen.bitcoin)
  end

end
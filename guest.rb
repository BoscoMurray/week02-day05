class Guest
  attr_reader :name, :bitcoin

  def initialize(name, bitcoin)
    @name = name
    @bitcoin = bitcoin
  end

  def update_bitcoin_balance(value)
    @bitcoin -= value
  end

end
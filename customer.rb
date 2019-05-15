class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def buy_drink(drink, pub)
    @wallet -= drink.price
    pub.increase_money(drink)
  end

end

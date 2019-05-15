class Pub

  attr_reader :name, :drinks, :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def increase_money(drink)
    @till += drink.price
  end

end

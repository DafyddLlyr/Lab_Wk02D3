class Pub

  attr_reader :name, :drinks, :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
    @alcohol_limit = 10
  end

  def increase_money(drink)
    @till += drink.price
  end

  def check_age(customer)
    return customer.age >= 18
  end

  def check_limit(customer)
    return customer.drunkenness < @alcohol_limit
  end

end

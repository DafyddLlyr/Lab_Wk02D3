class Pub

  attr_reader :name, :till, :stock

  def initialize(name, till, stock)
    @name = name
    @till = till
    @stock = stock
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

  def reduce_stock(drink)
    @stock[drink] -= 1 if @stock[drink] > 0
  end

  def stock_value
    total = 0
    for drink in @stock.keys
      total += drink.price * @stock[drink]
    end
    return total
  end

end

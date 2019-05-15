class Customer

  attr_reader :name, :wallet, :age
  attr_accessor :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def buy_drink(drink, pub)
    if pub.check_age(self) && pub.check_limit(self)
      @wallet -= drink.price
      pub.increase_money(drink)
      @drunkenness += drink.alcohol_level
    end
  end

  def buy_food(food)
    if @wallet >= food.price
      @wallet -= food.price
      if @drunkenness >= food.rejuvenation_level
        @drunkenness -= food.rejuvenation_level
      else
        @drunkenness = 0
      end
    end
  end

end

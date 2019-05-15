require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")
require_relative("../drink")
require_relative("../pub")
require_relative("../food")

class CustomerTest < MiniTest::Test

  def setup
    @drink_1 = Drink.new("Irn Bru", 2, 0)
    @drink_2 = Drink.new("Beer", 5, 2)
    @drink_3 = Drink.new("Whisky", 10, 5)
    @stock = { @drink_1 => 0, @drink_2 => 100, @drink_3 => 4 }
    @pub = Pub.new("CodeClan Bar", 100, @stock)
    @customer_1 = Customer.new("Bob", 50, 55)
    @customer_2 = Customer.new("Mary", 1000, 12)
    @food_1 = Food.new("Pizza", 7, 5)
    @food_2 = Food.new("Caviar", 100, 10)
  end

  def test_name
    assert_equal("Bob", @customer_1.name)
  end

  def test_wallet
    assert_equal(50, @customer_1.wallet)
  end

  def test_age
    assert_equal(55, @customer_1.age)
  end

  def test_drunkenness
    assert_equal(0, @customer_1.drunkenness)
  end

  def test_buy_drink__over_18
    @customer_1.buy_drink(@drink_3, @pub)
    assert_equal(40, @customer_1.wallet)
    assert_equal(110, @pub.till)
  end

  def test_buy_drink__under_18
    @customer_2.buy_drink(@drink_2, @pub)
    assert_equal(1000, @customer_2.wallet)
    assert_equal(100, @pub.till)
  end

  def test_buy_drink__no_drink
    @customer_2.buy_drink(@drink_1, @pub)
    assert_equal(0, @pub.stock[@drink_1])
  end

  def test_drunkenness__under_limit
    @customer_1.buy_drink(@drink_3, @pub)
    assert_equal(5, @customer_1.drunkenness)
  end

  def test_drunkenness__over_limit
    @customer_1.buy_drink(@drink_3, @pub)
    @customer_1.buy_drink(@drink_3, @pub)
    @customer_1.buy_drink(@drink_3, @pub)
    assert_equal(10, @customer_1.drunkenness)
  end

  def test_buy_food__has_money
    @customer_1.buy_food(@food_1)
    assert_equal(43, @customer_1.wallet)
  end

  def test_buy_food__no_money
    @customer_1.buy_food(@food_2)
    assert_equal(50, @customer_1.wallet)
  end

  def test_buy_food__takes_away_drunkenness
    @customer_1.drunkenness = 10
    @customer_1.buy_food(@food_1)
    assert_equal(5, @customer_1.drunkenness)
  end

  def test_buy_food__stops_at_zero
    @customer_1.drunkenness = 1
    @customer_1.buy_food(@food_1)
    assert_equal(0, @customer_1.drunkenness)
  end

end

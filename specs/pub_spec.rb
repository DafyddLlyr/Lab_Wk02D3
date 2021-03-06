require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")

class PubTest < MiniTest::Test

  def setup
    @drink_1 = Drink.new("Irn Bru", 2, 0)
    @drink_2 = Drink.new("Beer", 5, 2)
    @drink_3 = Drink.new("Whisky", 10, 5)
    @stock = { @drink_1 => 10, @drink_2 => 100, @drink_3 => 4 }
    @pub = Pub.new("CodeClan Bar", 100, @stock)
    @customer_1 = Customer.new("Bob", 1000, 55)
    @customer_2 = Customer.new("Mary", 100, 12)
  end

  def test_name
    assert_equal("CodeClan Bar", @pub.name)ru
  end

  def test_till
    assert_equal(100, @pub.till)
  end

  def test_stock
    assert_equal(3, @pub.stock.length)
  end

  def test_increase_money
    assert_equal(110, @pub.increase_money(@drink_3))
  end

  def test_check_age__over_18
    assert_equal(true, @pub.check_age(@customer_1))
  end

  def test_check_age__under_18
    assert_equal(false, @pub.check_age(@customer_2))
  end

  def test_check_limit__under
    assert_equal(true, @pub.check_limit(@customer_1))
  end

  def test_check_limit__over
    @customer_1.drunkenness = 15
    assert_equal(false, @pub.check_limit(@customer_1))
  end

  def test_reduce_stock__has_stock
    @pub.reduce_stock(@drink_1)
    assert_equal(9, @pub.stock[@drink_1])
  end

  def test_reduce_stock__no_stock
    5.times { @pub.reduce_stock(@drink_3) }
    assert_equal(0, @pub.stock[@drink_3])
  end

  def test_stock_value
    assert_equal(560, @pub.stock_value)
  end

end

require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")

class PubTest < MiniTest::Test

  def setup
    @drink_1 = Drink.new("Irn Bru", 2)
    @drink_2 = Drink.new("Beer", 5)
    @drink_3 = Drink.new("Whisky", 10)
    @pub = Pub.new("CodeClan Bar", 100, [@drink_1, @drink_2, @drink_3])
  end

  def test_name
    assert_equal("CodeClan Bar", @pub.name)
  end

  def test_till
    assert_equal(100, @pub.till)
  end

  def test_drink
    assert_equal(3, @pub.drinks.length)
  end

  def test_increase_money
    assert_equal(110, @pub.increase_money(@drink_3))
  end

end

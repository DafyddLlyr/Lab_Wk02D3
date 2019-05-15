require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new("Irn Bru", 2, 0)
  end

  def test_drink_name
    assert_equal("Irn Bru", @drink.name)
  end

  def test_drink_price
    assert_equal(2, @drink.price)
  end

end

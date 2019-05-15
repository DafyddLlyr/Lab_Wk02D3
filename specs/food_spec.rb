require("minitest/autorun")
require("minitest/rg")
require_relative("../food")

class FoodTest < MiniTest::Test

  def setup
    @food = Food.new("Pizza", 7, 5)
  end

  def test_name
    assert_equal("Pizza", @food.name)
  end

  def test_price
    assert_equal(7, @food.price)
  end

  def test_rejuvenation_level
    assert_equal(5, @food.rejuvenation_level)
  end

end

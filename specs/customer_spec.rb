require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")
require_relative("../drink")
require_relative("../pub")

class CustomerTest < MiniTest::Test

  def setup
    @drink_1 = Drink.new("Irn Bru", 2)
    @drink_2 = Drink.new("Beer", 5)
    @drink_3 = Drink.new("Whisky", 10)
    @pub = Pub.new("CodeClan Bar", 100, [@drink_1, @drink_2, @drink_3])
    @customer = Customer.new("Bob", 20)
  end

  def test_name
    assert_equal("Bob", @customer.name)
  end

  def test_wallet
    assert_equal(20, @customer.wallet)
  end

  def test_buy_drink
    @customer.buy_drink(@drink_3, @pub)
    assert_equal(10, @customer.wallet)
    assert_equal(110, @pub.till)
  end

end

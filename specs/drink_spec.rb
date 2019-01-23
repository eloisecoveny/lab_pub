require("minitest/autorun")
require("minitest/rg")

require_relative("../Drink")

class TestDrink < MiniTest::Test

  def setup
    @drink1 = Drink.new("Tennents", 3, 5)
  end

  def test_get_drink_name
    assert_equal("Tennents", @drink1.name)
  end

  def test_get_drink_price
    assert_equal(3, @drink1.price)
  end

end

  # A Pub should have a name, a till, and a collection of drinks
  # A Drink should have a name, and a price
  # A Customer should have a name, and a wallet
  # A Customer should be able to buy a Drink from the Pub, reducing the money in its wallet and increasing the money in the Pub's till

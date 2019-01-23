require("minitest/autorun")
require("minitest/rg")
require_relative("../Drink")
require_relative("../Pub")
require_relative("../Customer")
require_relative("../Food")

class TestPub < MiniTest::Test

  def setup
    @drink1 = Drink.new("Tennents", 3, 5)
    @drink2 = Drink.new("Gin Tonic", 4, 7)

    @drinks = [@drink1, @drink2]

    @food1 = Food.new("Fish & Chips", 3, 2)
    @food2 = Food.new("Cottage Pie", 4, 3)

    @food = [@food1, @food2]

    @pub = Pub.new("Hootannanys", 300, @drinks, @food)

    @customer1 = Customer.new("Bobby", 25, 45)
  end

  def test_get_pub
    assert_equal("Hootannanys", @pub.name)
    assert_equal(300, @pub.till)
  end

  def test_drink_stock_quantity
    assert_equal(2, @pub.stock_quantity())
  end

  def test_drink_in_stock
    result = @pub.drink_in_stock("Tennents")
    assert_equal(true, result)
  end

  def test_food_in_stock
    result = @pub.food_in_stock("Fish & Chips")
    assert_equal(true, result)
  end

  def test_sell_drink
    @pub.sell_drink(@drink1, @customer1)
    assert_equal(1, @pub.stock_quantity())
    assert_equal(303, @pub.till)
  end

  def test_sell_food
    @pub.sell_food(@food1, @customer1)
    assert_equal(303, @pub.till)
  end

  def test_drink_stock_value
    assert_equal(7, @pub.drink_stock_value)
  end

end
  # Add an age to the Customer. Make sure the Pub checks the age before serving the Customer.
  # Add alcohol_level to the Drink, and a drunkenness level to the Customer. Every time a Customer buys a drink, the drunkenness level should go up by the alcohol_level.
  # Pub should refuse service above a certain level of drunkenness!

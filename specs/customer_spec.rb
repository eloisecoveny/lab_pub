require("minitest/autorun")
require("minitest/rg")
require_relative("../Customer")
require_relative("../Drink")
require_relative("../Pub")
require_relative("../Food")

class TestCustomer < MiniTest::Test

  def setup
    @drink1 = Drink.new("Tennents", 3, 5)
    @drink2 = Drink.new("Gin Tonic", 4, 7)

    @food1 = Food.new("Fish & Chips", 3, 2)
    @food2 = Food.new("Pie", 4, 3)

    @pub = Pub.new("Hootannanys", 300, [@drink1, @drink2], [@food1, @food2])

    @customer = Customer.new("Bobby", 25, 45)
  end

  def test_get_customer_name
    assert_equal("Bobby", @customer.name)
  end

  def test_get_wallet
    assert_equal(25, @customer.wallet)
  end

  def test_can_afford
    assert_equal(true, @customer.can_afford(@drink1))
  end

  def test_legal_age
    assert_equal(true, @customer.legal_age())
  end

  def test_not_too_drunk?
    assert_equal(true, @customer.not_too_drunk?())
  end

  def test_customer_buys_drink
    @customer.buys_drink(@drink2, @pub, @customer)
    assert_equal(21, @customer.wallet)
    assert_equal(7, @customer.drunkenness)
  end

  def test_buys_food
    @customer.buys_food(@food2, @pub, @customer)
    assert_equal(21, @customer.wallet)
  end
end

  # Add an age to the Customer. Make sure the Pub checks the age before serving the Customer.
  # Add alcohol_level to the Drink, and a drunkenness level to the Customer. Every time a Customer buys a drink, the drunkenness level should go up by the alcohol_level.
  # Pub should refuse service above a certain level of drunkenness!

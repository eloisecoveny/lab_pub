require("minitest/autorun")
require("minitest/rg")

require_relative("../Food")

class TestFood < MiniTest::Test

  def setup
    @food1 = Food.new("Fish & Chips", 3, 2)
    @food2 = Food.new("Cottage Pie", 4, 3)
  end

  def test_get_food_name
    assert_equal("Fish & Chips", @food1.name)
  end

  def test_get_food_price
    assert_equal(4, @food2.price)
  end
end

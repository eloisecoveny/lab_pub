class Pub

  attr_reader :name, :drinks, :food
  attr_accessor :till

  def initialize(name, till, drinks, food)
    @name = name
    @till = till
    @drinks = drinks
    @food = food
  end

  def stock_quantity()
    total = 0
    @drinks.each { |drink| total += 1 }
    return total
  end

  def drink_in_stock(drink_name)
    @drinks.each do |drink|
    return true if drink.name == drink_name
    return false
  end
  end

  def food_in_stock(food_name)
    @food.each do |item|
    return true if item.name == food_name
    return false
  end
  end

  def sell_drink(drink, customer)
    if drink_in_stock(drink.name)
      if customer.legal_age() && customer.drunkenness()
        @drinks.delete(drink)
        @till += drink.price
      end
    end
  end

  def sell_food(food, customer)
    if food_in_stock(food.name)
      @till += food.price
      @food.delete(food)
    end
  end

def drink_stock_value()
  value = 0
  @drinks.each { |drink| value += drink.price }
  return value
end

end

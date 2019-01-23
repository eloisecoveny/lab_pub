class Customer

  attr_reader :name, :age
  attr_accessor :wallet, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def can_afford(item)
    return item.price <= @wallet
    return false
  end

  def legal_age()
    return age >= 18
  end

  def not_too_drunk?()
    return drunkenness < 20
  end

  def buys_drink(drink, pub, customer)
    if can_afford(drink)
      pub.sell_drink(drink, customer)
      @wallet -= drink.price
      @drunkenness += drink.strength
    end
  end

  def buys_food(food, pub, customer)
    if can_afford(food)
      pub.sell_food(food, customer)
      @wallet -= food.price
      @drunkenness -= food.rejuvenation_level
    end
  end

end

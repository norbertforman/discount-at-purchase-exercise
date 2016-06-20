class Item
  attr_accessor :productCode, :name, :price

  def initialize(productCode, name, price)
    @productCode = productCode
    @name = name
    @price = price
  end
end

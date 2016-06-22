class Item
  attr_accessor :productCode, :name, :price

  def initialize(productCode, name, price)
    @productCode = productCode
    @name = name
    @price = price
  end

  def validate!
    check_data_valid
    return true
  end

  private
    def check_data_valid
      raise InvalidItemError, 'product code must be a string' if !@productCode.instance_of?(String)
      raise InvalidItemError, 'name must be a string' if !@name.instance_of?(String)
      raise InvalidItemError, 'price is not a float number' if @price.to_f != @price
    end
end

class Item
  attr_accessor :productCode, :name, :price

  def initialize(productCode, name, price)
    @productCode = productCode
    @name = name
    @price = price
  end

  def validate!
    check_if_present
    check_data_valid
    return true
  end

  private
    def check_if_present
      raise CustomError, 'product code can\'t be blank' if @productCode.nil?
      raise CustomError, 'name can\'t be blank' if @name.nil?
      raise CustomError, 'price can\'t be blank' if @price.nil?
    end

    def check_data_valid
      raise CustomError, 'product code must be a string' if !@productCode.instance_of?(String)
      raise CustomError, 'name must be a string' if !@name.instance_of?(String)
      raise CustomError, 'price is not a float number' if @price.to_f != @price
    end
end

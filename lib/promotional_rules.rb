class PromotionalRules
  def initialize(discount, productCode = nil)
    @discount = discount
    @productCode = productCode
  end

  def apply!(items)
    if apply?(items)
      items_with_rules(items).map do |item|
        perform_rule!(item)
      end
    end
  end

  private
    def items_with_rules(items)
      return items if @productCode == nil
      return items.select { |item| item.productCode == @productCode }
    end
end

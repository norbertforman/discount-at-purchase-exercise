class PromotionalRules
  def initialize(discount, productCode = nil)
    @discount = discount.to_f
    @productCode = productCode
  end

  def apply!(items)
    rule_items = items_with_rules(items)
    if apply?(rule_items)
      rule_items.map do |item|
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

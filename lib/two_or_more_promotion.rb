class TwoOrMorePromotion < PromotionalRules
  private
    def perform_rule!(item)
      item.price = @discount
    end

    def apply?(items)
      return items.size > 2
    end
end

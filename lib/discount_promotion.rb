class DiscountPromotion < PromotionalRules
    private
      def perform_rule!(item)
        percent = 1.0 - (@discount / 100.0)
        item.price = item.price * percent
      end

      def apply?(items)
        return items.map(&:price).inject(:+) > 60
      end
end

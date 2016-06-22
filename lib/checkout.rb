class Checkout
  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
    @items = []
  end

  def scan(item)
    item.validate!
    @items << item
  end

  def total
    @promotional_rules.each do |promotional_rules|
      promotional_rules.apply!(@items)
    end
    return @items.map(&:price).inject(:+).round(2)
  end
end

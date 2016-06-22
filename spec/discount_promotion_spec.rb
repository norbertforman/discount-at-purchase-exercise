require 'helper_spec'

describe DiscountPromotion do
  before(:each) do
    @discountPromotion = DiscountPromotion.new(10)
  end

  describe "Check two or more promotion Rule" do
    it "promotion should not apply" do
      items = [
        Item.new('001', 'Travel Card Holder', 9.25),
        Item.new('002', 'Personalised cufflinks', 45.00)
      ]
      @discountPromotion.apply!(items)
      expect(items.map(&:price).inject(:+)).to eq(54.25)
    end

    it "promotion should apply" do
      items = [
        Item.new('001', 'Travel Card Holder', 9.25),
        Item.new('002', 'Personalised cufflinks', 45.0),
        Item.new('003', 'Kids T-shirt', 19.95)
      ]
      @discountPromotion.apply!(items)
      expect(items.map(&:price).inject(:+)).to eq(66.78)
    end
  end
end

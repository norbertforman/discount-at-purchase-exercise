require 'helper_spec'

describe TwoOrMorePromotion do
  before(:each) do
    @twoOrMorePromotion = TwoOrMorePromotion.new(8.5, '001')
  end

  describe "Check two or more promotion Rule" do
    it "promotion should not apply" do
      items = [
        Item.new('001', 'Travel Card Holder', 9.25),
        Item.new('002', 'Personalised cufflinks', 45.00),
        Item.new('003', 'Kids T-shirt', 19.95),
      ]
      @twoOrMorePromotion.apply!(items)
      expect(items.map(&:price).inject(:+)).to eq(74.2)
    end

    it "promotion should apply" do
      items = [
        Item.new('001', 'Travel Card Holder', 9.25),
        Item.new('001', 'Travel Card Holder', 9.25),
        Item.new('003', 'Kids T-shirt', 19.95),
      ]
      @twoOrMorePromotion.apply!(items)
      expect(items.map(&:price).inject(:+)).to eq(36.95)
    end
  end
end

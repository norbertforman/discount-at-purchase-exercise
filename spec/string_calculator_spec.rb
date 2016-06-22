require 'spec_helper'

describe Checkout do
  before(:each) do
    @checkout = Checkout.new([
      TwoOrMorePromotion.new(8.5, '001'),
      DiscountPromotion.new(10)
    ])
  end

  describe 'check if the item scanning works' do
    it 'save correct items' do
      items = [
        Item.new('001', 'Travel Card Holder', 9.25),
        Item.new('002', 'Personalised cufflinks', 45.00),
        Item.new('003', 'Kids T-shirt', 19.95),
      ]
      items.each { |item| @checkout.scan(item) }
      expect(@checkout.instance_variable_get('@items')).to eq(items)
    end
    it 'incorrect price' do
      item = Item.new('001', 'Travel Card Holder', '9.25')
      expect { @checkout.scan(item) }.to raise_error(CustomError)
    end
  end

  describe "check if the total calculation works" do
    it "1st use case" do
      @checkout.scan(Item.new('001', 'Travel Card Holder', 9.25))
      @checkout.scan(Item.new('002', 'Personalised cufflinks', 45.0))
      @checkout.scan(Item.new('003', 'Kids T-shirt', 19.95))
      expect(@checkout.total).to eq(66.78)
    end
    it "2nd use case" do
      @checkout.scan(Item.new('001', 'Travel Card Holder', 9.25))
      @checkout.scan(Item.new('003', 'Kids T-shirt', 19.95))
      @checkout.scan(Item.new('001', 'Travel Card Holder', 9.25))
      expect(@checkout.total).to eq(36.95)
    end
    it "3rd use case" do
      @checkout.scan(Item.new('001', 'Travel Card Holder', 9.25))
      @checkout.scan(Item.new('002', 'Personalised cufflinks', 45.0))
      @checkout.scan(Item.new('001', 'Travel Card Holder', 9.25))
      @checkout.scan(Item.new('003', 'Kids T-shirt', 19.95))
      expect(@checkout.total).to eq(73.76)
    end
  end
end

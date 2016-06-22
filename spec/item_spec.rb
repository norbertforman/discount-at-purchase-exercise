require 'helper_spec'

describe Item do
  describe "Check item validity" do
    it "valid item" do
      item = Item.new('001', 'Travel Card Holder', 9.25)
      expect(item.validate!).to eq(true)
    end
  end

  describe "Check item invalidity" do
    it "invalid price" do
      item = Item.new('002', 'Personalised cufflinks', '45.0')
      expect { item.validate! }.to raise_error(InvalidItemError)
    end
    it "invalid product code" do
      item = Item.new(123, 'Personalised cufflinks', 45.0)
      expect { item.validate! }.to raise_error(InvalidItemError)
    end
    it "invalid name code" do
      item = Item.new('002', 123, 45.0)
      expect { item.validate! }.to raise_error(InvalidItemError)
    end
  end
end

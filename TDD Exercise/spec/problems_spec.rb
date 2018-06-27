require 'problems'

RSpec.describe "Problems" do 
  describe "#my_dups" do 
    let(:arr) {[1, 2, 1, 5, "lunch"]}
    it "should be received by an array" do
      expect(arr).to receive(:my_dups)
      arr.my_dups
    end  
    it "should return new array" do
      expect(arr.my_dups).to be_a(Array)
      expect(arr.my_dups).to_not be(arr)
    end
    it "Dups should return uniq array" do
      expect(arr.my_dups).to eq(arr.uniq)
    end
  end
  
  describe "#two_sum" do
    let(:arr) {[-1, 0, 2, -2, 1]}
    let(:pairs) {[[0, 4], [2, 3]]}
    
    it "returns positions of pairs of numbers that add to zero" do
      expect([1, 2, 3, -2].two_sum).to eq([1,3])
    end

    it "finds multiple pairs in the right order" do
      expect(arr.two_sum).to eq(pairs)
    end

    it "finds pairs with same element" do
      expect([4, -4, -4].two_sum).to eq([[0,1],[0,2]])
    end

    it "returns [] when no pair is found" do
      expect([1, 2, 3, 4].two_sum).to eq([])
    end
    
  end
end
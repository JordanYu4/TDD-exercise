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
      expect([1, 2, 3, -2].two_sum).to eq([[1,3]])
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
  
  describe "#my_transpose" do 
    let(:arr) {[[0, 1, 2],
                [3, 4, 5],
                [6, 7, 8]]}
    let(:transposed) {[[0, 3, 6],
                       [1, 4, 7],
                       [2, 5, 8]]}
    
    it "transposes a matrix" do 
      expect(arr.my_transpose).to eq(transposed)
    end
    
    it "returns empty array if input is empty" do 
      expect([].my_transpose).to eq([])
    end 
    
    it "returns the same array if transposed twice" do 
      expect(arr.my_transpose.my_transpose).to eq(arr)
    end 
  end
  
  describe "#stock_picker" do 
    it "returns the best days to buy & sell" do 
      expect([3,1,2,7,6].stock_picker).to eq([1,3])
    end 
    
    it "returns empty array if stock price never increases" do 
      expect([4,4,4,4,4].stock_picker).to eq([])
    end
  end 
end
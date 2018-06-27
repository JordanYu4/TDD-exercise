require "hanoi"

RSpec.describe Hanoi do 
  let(:game) { Hanoi.new }
  
  describe "#initialize" do
    
    it "initializes an array of three towers" do
      expect(game.discs).to be_an(Array) 
      expect(game.discs[0]).to eq([3,2,1])
    end
    
  end
  describe "#move" do
    
    it "moves the topmost disc to another pile" do
      game.move_disc([0, 1])
      expect(game.discs[1]).to eq([1])
      expect(game.discs[0]).to eq([3, 2])
      game.move_disc([0, 2])
      game.move_disc([1, 2])
      expect(game.discs).to eq([[3], [], [2, 1]])
    end
  end
  describe "#won?" do 
    it "returns false if game isn't over" do 
      expect(game.won?).to be false
    end
    it "returns true if game is over" do
      game.discs = [[], [], [3, 2, 1]]
      expect(game.won?).to be true
    end
  end
  
end
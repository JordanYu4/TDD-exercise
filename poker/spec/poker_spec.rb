require 'card'
require 'deck'

RSpec.describe Card do
  describe "#initialize" do
    let(:card) { Card.new(:hearts, :king) }
    it "Card should have a suit" do
      expect(card.suit).to eq(:hearts)
    end
    it "Card should have a value" do
      expect(card.value).to eq(:king)
    end
  end
end

RSpec.describe Deck do 
  let(:deck) { Deck.new }
  let(:cards) { deck.cards }
  describe "#initialize" do 
    it "should have 52 cards" do
      expect(cards.length).to eq(52)
    end
    it "should contain instances of cards" do 
      expect(cards[0]).to be_a(Card)
    end
    it "should contain 13 of each suit" do
      expect(cards.count { |card| card.suit == :spades}).to eq(13)
      expect(cards.count { |card| card.suit == :clubs}).to eq(13)
      expect(cards.count { |card| card.suit == :hearts}).to eq(13)
      expect(cards.count { |card| card.suit == :diamonds}).to eq(13)
    end
  end
  
  describe "#shuffle!" do 
    it "should shuffle the deck" do
      second_deck = cards.dup 
      deck.shuffle!
      expect(cards).to_not eq(second_deck)
    end
  end
  
  
end
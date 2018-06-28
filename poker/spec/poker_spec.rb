require 'card'
require 'deck'
require 'player'

RSpec.describe Card do
  describe "#initialize" do
    let(:card) { Card.new(:hearts, :king) }
    it "card should have a suit" do
      expect(card.suit).to eq(:hearts)
    end
    it "card should have a value" do
      expect(card.value).to eq(:king)
    end
    it "should raise an error if suit invalid" do
      expect {Card.new(:triangle, :king)}.to raise_error(ArgumentError)
    end
    it "should raise an error if value invalid" do
      expect {Card.new(:hearts, :pawn)}.to raise_error(ArgumentError)
    end
  end
end

RSpec.describe Deck do 
  subject(:deck) { Deck.new }
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
    it "should contain 4 of each value" do
      types = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
      types.each do |type|
        expect(cards.count { |card| card.value == type} ).to eq(4)
      end
    end
  end
  
  describe "#shuffle!" do 
    it "should shuffle the deck" do
      second_deck = cards.dup 
      deck.shuffle!
      expect(cards).to_not eq(second_deck)
    end
  end
  
  describe "#take" do 
    it "should return [] if argument is zero" do
      expect(deck.take(0)).to eq([])
    end
    it "should return the number of cards requested" do
      expect(deck.take(5).length).to eq(5)
    end
    it "should decrement the deck by the number of cards requested" do
      deck.take(5)
      expect(cards.length).to eq(47)
    end
    it "should return an array of cards" do
      expect(deck.take(5)).to be_an(Array)
      expect(deck.take(5).last).to be_a(Card)
    end
  end
end

RSpec.describe Player do 
  let(:deck) { Deck.new }
  subject(:player) {Player.new(deck)}
  describe "#initialize" do 
    it "player should begin with a hand of five cards" do
      expect(player.hand.length).to eq(5)
    end
    it "player should begin with an empty pot" do
      expect(player.pot).to eq(0)
    end
  end
  
  describe "#draw" do
    it "should place a number of cards requested in hand" do
      player.draw(2)
      expect(player.hand.length).to eq(7)
    end
    
  end
end
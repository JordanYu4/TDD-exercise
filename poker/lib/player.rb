require_relative 'deck'
require_relative 'hand'

class Player
  attr_accessor :hand, :pot, :deck
  
  def initialize(deck)
    @hand = Hand.new
    @deck = deck
    @pot = 0
  end
  
  def draw(n)
    hand.concat(deck.take(n))
  end 
  
end
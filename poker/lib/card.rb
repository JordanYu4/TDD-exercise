class Card
  
  SUITS = [:spades, :clubs, :hearts, :diamonds]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
  
  attr_reader :suit, :value
  
  def initialize(suit, value)
    @suit = suit
    @value = value
    raise ArgumentError unless SUITS.include?(suit) && VALUES.include?(value)
  end
  
end
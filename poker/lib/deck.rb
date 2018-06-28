require 'card'

class Deck
  
  attr_accessor :cards
  
  def initialize
    @cards = []
    populate
  end
  
  def populate
    suits = [:spades, :clubs, :hearts, :diamonds]
    nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
    suits.each do |suit|
      nums.each do |num|
        card = Card.new(suit, num)
        @cards << card
      end
    end
  end
  
  def shuffle!
    cards.shuffle!
  end

end
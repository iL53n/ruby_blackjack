require_relative './card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = create_deck
  end

  def create_deck
    cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank, value|
        cards << Card.new(suit, rank, value)
      end
    end
    cards.shuffle!
  end
end
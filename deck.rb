require_relative './card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = create_deck
  end

  def new_card
    @cards.pop
  end

  private

  def create_deck
    cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |rank|
        cards << Card.new(suit, rank.first)
      end
    end
    cards.shuffle!
  end
end
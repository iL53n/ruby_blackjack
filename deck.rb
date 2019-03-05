class Deck
  attr_accessor :deck

  def initialize
    @deck = create_deck
    shuffle
  end

  def create_deck
    deck = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank, value|
        deck << Card.new(suit, rank, value)
      end
    end
  end

  def shuffle
    @deck.shuffle!
  end
end
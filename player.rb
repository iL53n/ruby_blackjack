class Player
  START_CASH = 100

  attr_reader :name
  attr_accessor :cash, :cards

  def initialize
    #@name
    @cash = START_CASH
    @hand = Hand.new
  end

  def add_card(card)
    @hand << card
  end

  def show_cards #????
    @hand.each do |card|
      card.suit
      card.rank
    end
  end
end

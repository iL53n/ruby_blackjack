require_relative './hand'

class Player
  START_CASH = 100

  attr_reader :name
  attr_accessor :cash, :cards, :hand

  def initialize
    @cash = START_CASH
    @hand = Hand.new
  end

  def add_card(card)
    @hand.cards << card
  end

  def show_cards #????
    @hand.cards.each do |card|
      card.suit
      card.rank
    end
  end

  def sum_cards
    @hand.sum_cards
  end
end

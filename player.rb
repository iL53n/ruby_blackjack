require_relative './hand'

class Player
  START_CASH = 100

  attr_reader :name
  attr_accessor :cash, :cards, :hand

  def initialize(name)
    @name = name
    @cash = START_CASH
    @hand = Hand.new
  end

  def add_card(card)
    @hand.cards << card
  end

  def sum_cards
    @hand.sum_cards
  end

  def plus_money(sum)
    @cash += sum
  end

  def minus_money(sum)
    @cash -= sum
  end
end

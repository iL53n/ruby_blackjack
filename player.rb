require_relative './hand'

class Player
  START_CASH = 100

  attr_reader :name
  attr_accessor :cash, :hand

  def initialize(name)
    @name = name
    @cash = START_CASH
    @hand = Hand.new
  end

  def cards
    @hand.cards
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

  def fold_cards
    @hand.cards = []
  end

  def can_take_card?
    !hand.full_hand?
  end
end

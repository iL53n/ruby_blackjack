class Player

  attr_accessor :cash

  def initialize
    @cash = 100
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def show_cards

  end
end

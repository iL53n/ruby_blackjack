class Dealer < Player

  DEALER = "Dealer".freeze

  def initialize
    @name = DEALER
    super
  end

  def hidden_cards
    @cards.map {'*'}.join(' ')
  end
end
class Dealer < Player
  DEALER_NAME = "Dealer".freeze

  def initialize
    @name = DEALER_NAME
    super
  end

  def hidden_cards
    @hand.map {'🂠'}.join(' ')
  end
end
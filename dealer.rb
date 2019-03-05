class Dealer < Player
  DEALER_NAME = "Dealer".freeze

  def initialize
    super(DEALER_NAME)
  end
end
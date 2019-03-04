class Dealer < Player

  DEALER = "Dealer".freeze

  def initialize
    @name = DEALER
    super
  end

  def hide_cards
    @cards.size.times { print " 🂠 " }
    puts
  end
end
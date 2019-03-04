class Dealer < Player

  def initialize
    @name = 'Dealer'
    super
  end

  def hide_cards
    @cards.size.times {print ' * '}
  end
end
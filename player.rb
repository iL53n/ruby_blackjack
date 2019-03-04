class Player

  attr_reader :name
  attr_accessor :cash

  def initialize
    @name
    @cash = 100
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def show_cards
    amount_cards = 0
    @cards.each do |card|
      card.each do |key, value|
        print "#{key}  "
        amount_cards += value.to_i
      end
    end
    puts "---> #{amount_cards} "
  end


end

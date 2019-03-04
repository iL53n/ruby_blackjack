class Player

  attr_reader :name
  attr_accessor :cash, :cards

  def initialize
    @name
    @cash = 100
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def show_cards
    @cards.each do |card|
      card.each do |key, value|
        print "#{key} "
      end
    end
    puts
  end

  def sum_cards
    amount = 0
    @cards.each do |card|
      card.each do |key, value|
        #ACE?
        amount += value.to_i
      end
    end
    amount
  end



end

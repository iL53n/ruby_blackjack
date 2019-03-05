class Hand
  attr_accessor :cards

  BLACK_JACK = 21.freeze
  ACE_CORRECT = 10.freeze

  def initialize
    @cards = []
  end

  def sum_cards
    sum ||= 0
    sum = @cards.sum(&:value)

    @cards.each do |card|
      if sum > BLACK_JACK && card.ace?
        sum -= ACE_CORRECT
      end
    end
    sum
  end
end
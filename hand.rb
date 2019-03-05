class Hand
  attr_accessor :cards

  BLACK_JACK = 21
  ACE_CORRECT = 10

  def initialize
    @cards = []
  end

  def sum_cards
    sum ||= 0
    sum = @cards.sum(&:value)

    @cards.each do |card|
      sum -= ACE_CORRECT if sum > BLACK_JACK && card.ace?
    end
    sum
  end
end
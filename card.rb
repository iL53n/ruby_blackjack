class Card
  attr_reader :suit, :rank, :value

  SUITS = %w[♠ ♢ ♣ ♡]
  RANKS = {
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "10" => 10,
      "J"=> 10,
      "Q" => 10,
      "K" => 10,
      "A" => 11
  }

  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @value = value
  end

  def ace?
    @value == 11
  end
end
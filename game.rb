require_relative './player'
require_relative './user'
require_relative './dealer'

class Game

  attr_reader :player, :dealer

  def initialize
    @bank = 0
    @deck = [{"2♠" => 2},        {"2♢" => 2},       {"2♣" => 2},       {"2♡" => 2},
             {"3♠" => 3},        {"3♢" => 3},       {"3♣" => 3},       {"3♡" => 3},
             {"4♠" => 4},        {"4♢" => 4},       {"4♣" => 4},       {"4♡" => 4},
             {"5♠" => 5},        {"5♢" => 5},       {"5♣" => 5},       {"5♡" => 5},
             {"6♠" => 6},        {"6♢" => 6},       {"6♣" => 6},       {"6♡" => 6},
             {"7♠" => 7},        {"7♢" => 7},       {"7♣" => 7},       {"7♡" => 7},
             {"8♠" => 8},        {"8♢" => 8},       {"8♣" => 8},       {"8♡" => 8},
             {"9♠" => 9},        {"9♢" => 9},       {"9♣" => 9},       {"9♡" => 9},
             {"10♠" => 10},      {"10♢" => 10},     {"10♣" => 10},     {"10♡" => 10},
             {"J♠" => 10},       {"J♢" => 10},      {"J♣" => 10},      {"J♡" => 10},
             {"Q♠" => 10},       {"Q♢" => 10},      {"Q♣" => 10},      {"Q♡" => 10},
             {"K♠" => 10},       {"K♢" => 10},      {"K♣" => 10},      {"K♡" => 10},
             {"A♠" => [1, 11]},  {"A♢" => [1, 11]}, {"A♣" => [1, 11]}, {"A♡" => [1, 11]}]
  end

  def start_game
    @player = User.new
    @dealer = Dealer.new
    new_deal
  end

  def new_deal
    @deck.shuffle!
    2.times do
      @player.add_card(new_card)
      @dealer.add_card(new_card)
    end
    auto_bet
  end

  def new_card
    @deck.pop
  end

  def auto_bet
    @player.cash -= 10
    @dealer.cash -= 10
    @bank = 20
  end
end
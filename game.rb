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
    board
    player_menu
  end

  def new_card
    @deck.pop
  end

  def auto_bet
    @player.cash -= 10
    @dealer.cash -= 10
    @bank = 20
  end

  def board
    puts "============================================"
    puts @dealer.name
    @dealer.hide_cards
    puts "Cash: #{@dealer.cash}"
    puts "--------------------------------------------"
    puts "Bank: #{@bank}"
    puts "--------------------------------------------"
    puts @player.name
    @player.show_cards
    puts "Cash: #{@player.cash}"
    puts "============================================"
  end

  def player_menu
    puts "| 1 - ADD CARD | 2 - PASS | 3 - OPEN CARDS |"
    puts "============================================"
    print "Your choice: "
    choice = gets.to_i
    case choice
      when 1
        @player.add_card(new_card)
        #переход хода к дилеру
      when 2
        #переход хода к дилеру
    end
  end
end
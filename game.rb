require_relative './player'
require_relative './user'
require_relative './dealer'

class Game

  PLAYER_WIN = "YOU WIN !!!"
  DEALER_WIN = "YOU LOSE !!!"
  BUST = "BUST"
  DRAW = "DRAW"
  SHOWDOWN = "-= SHOWDOWN =-"
  BLACKJACK = 21
  DECK = [{"2♠" => 2},        {"2♢" => 2},       {"2♣" => 2},       {"2♡" => 2},
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
          {"A♠" => 11},  {"A♢" => 11}, {"A♣" => 11}, {"A♡" => 11}]

  attr_reader :player, :dealer, :bank

  def initialize
    @bank = 0
    new_deck
  end

  def start_game
    @player = User.new
    @dealer = Dealer.new
    new_deal
  end

  def new_deal
    @player.cards = []
    @dealer.cards = []
    new_deck
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

  def new_deck
    @deck = DECK
    @deck.shuffle!
  end

  def auto_bet
    @player.cash -= 10
    @dealer.cash -= 10
    @bank = 20
  end

  def board
    puts "================================"
    puts @dealer.name
    @dealer.hide_cards
    puts "Cash: #{@dealer.cash}"
    puts "--------------------------------"
    puts "Bank: #{@bank}"
    puts "--------------------------------"
    puts @player.name
    @player.show_cards
    puts "Cash: #{@player.cash}"
    puts "================================"
  end

  def player_menu
    puts "  | 1 - ADD CARD || 2 - PASS |  " # не понимаю зачем кнопка "открыть карты" при указанных условиях
    puts "================================"
    choice_player
  end

  def choice_player
    print "Your choice: "
    choice = gets.to_i

    case choice
      when 1
        @player.add_card(new_card)
        board
        choice_dealer
      when 2
        choice_dealer
        board
        showdown
    end
  end

  def choice_dealer
    puts "Move dealer ..."
    #sleep(2)
    @dealer.sum_cards < 17 ? @dealer.add_card(new_card) : nil
    board
    showdown
  end

  def showdown
    puts SHOWDOWN
    puts @dealer.name
    @dealer.show_cards
    puts @player.name
    @player.show_cards
    definition_winner
  end

  def definition_winner
    dealer_result = BLACKJACK - @dealer.sum_cards
    player_result = BLACKJACK - @player.sum_cards
    difference = dealer_result - player_result

    if player_result.negative? && dealer_result.positive?
      dealer_winner
    elsif player_result.positive? && dealer_result.negative?
      player_winner
    else
      if difference.nil?
        draw_no_winner
      elsif difference.positive?
        player_winner
      else difference.negative?
      dealer_winner
      end
    end
    end_game
  end

  def dealer_winner
    @dealer.cash += @bank
    @bank = 0
    puts DEALER_WIN
  end

  def player_winner
    @player.cash += @bank
    @bank = 0
    puts PLAYER_WIN
  end

  def draw_no_winner
    @player.cash += 10
    @dealer.cash += 10
    @bank = 0
    puts DRAW
  end

  def end_game
    print "Play again(Y/N)? "
    input = gets.chomp.upcase
    if input == "Y"
      new_deal
    else input == "N"
      exit
    end
  end

end
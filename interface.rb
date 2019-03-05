
class Interface
  NO_NAME = "NO_NAME".freeze
  INPUT_NAME = "Your name: ".freeze
  PLAYER_WIN = "YOU WIN !!!".freeze
  DEALER_WIN = "YOU LOSE !!!".freeze
  DRAW = "DRAW".freeze
  SHOWDOWN = "-= SHOWDOWN =-".freeze
  DOLLAR_SYM = "$".freeze
  BANK = "Bank: ".freeze
  ODD_LINE =    "--------------------------------".freeze
  DOUBLE_LINE = "================================".freeze
  CHOICE_BUTTON =   "  | 1 - ADD CARD || 2 - PASS |  ".freeze
  CHOICE_TITLE = "Your choice: ".freeze
  CHOICE_DEALER = "Choice dealer ...".freeze
  ADD_DEALER = "Dealer add card.".freeze
  PASS_DEALER = "Dealer pass.".freeze

  attr_reader :player_name

  def initialize
    @player_name = request_name
  end

  def request_name
    print INPUT_NAME
    name = gets.chomp
    name = NO_NAME if name.to_s.empty?
    name
  end

  def board(player, dealer, bank)
    puts DOUBLE_LINE
    puts name_cash(dealer)
    puts hidden_cards(dealer)
    puts ODD_LINE
    puts show_bank(bank)
    puts ODD_LINE
    puts name_cash(player)
    puts show_cards(player)
    puts player.sum_cards
    puts DOUBLE_LINE
  end

  def player_menu
    puts CHOICE_BUTTON # не понимаю зачем кнопка "открыть карты" при указанных условиях
    puts DOUBLE_LINE
  end

  def choice_player
    print CHOICE_TITLE
    pause
    gets.to_i
  end

  def choice_dealer
    puts CHOICE_DEALER
    pause
  end

  def add_dealer
    puts ADD_DEALER
    pause
  end

  def pass_dealer
    puts PASS_DEALER
    pause
  end

  def player_win
    puts PLAYER_WIN
    pause
  end

  def dealer_win
    puts DEALER_WIN
    pause
  end

  def draw_info
    pause
    puts DRAW
  end

  def showdown(player, dealer)
    puts DOUBLE_LINE
    puts SHOWDOWN
    puts DOUBLE_LINE
    puts name_cash(dealer)
    puts show_cards(dealer)
    puts dealer.sum_cards
    puts ODD_LINE
    puts name_cash(player)
    puts show_cards(player)
    puts player.sum_cards
    puts DOUBLE_LINE
  end

  def end_game
    print "Play again(Y/N)? "
    gets.chomp.upcase
  end

  def name_cash(player)
    player.name + ": #{player.cash}" + DOLLAR_SYM
  end

  def hidden_cards(player)
    player.hand.cards.map {'🂠'}.join(' ')
  end

  def show_cards(player)
    player.hand.cards.map { |card| card.rank + card.suit}.join(' ')
  end

  def show_bank(bank)
    BANK + "#{bank.bank}" + DOLLAR_SYM
  end

  def pause
    sleep(2)
  end
end
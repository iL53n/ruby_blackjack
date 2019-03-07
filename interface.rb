class Interface
  NO_NAME = "NO_NAME".freeze
  INPUT_NAME = "Your name: ".freeze
  PLAYER_WIN = "YOU WIN !!!".freeze
  DEALER_WIN = "YOU LOSE !!!".freeze
  DRAW = "DRAW".freeze
  SHOWDOWN = "-= SHOWDOWN =-".freeze
  DOLLAR_SYM = "$".freeze
  BANK = "Bank: ".freeze
  ODD_LINE =        "----------------------------------".freeze
  DOUBLE_LINE =     "==================================".freeze
  CHOICE_BUTTON =   "|1 - ADD CARD||2 - PASS||3 - OPEN|".freeze
  CHOICE_TITLE = "Your choice: ".freeze
  CHOICE_DEALER = "Choice dealer ...".freeze
  ADD_DEALER = "Dealer add card.".freeze
  PASS_DEALER = "Dealer pass.".freeze
  NO_MONEY = "Game over! One of the players ran out of money.".freeze
  PLAY_AGAIN = "Play again(Y/N)? ".freeze
  YES = "Y".freeze
  MAX_CARDS = "You already have the maximum number of cards(3).".freeze
  MAX_CARDS_DEALER = "Dealer pass.Dealer already has the maximum number of cards(3).".freeze
  OPEN_CARDS = "Opening cards...".freeze
  AUTO_OPEN_CARDS = "Auto opening cards! You and dealer have the maximum number of cards.".freeze

  def ask_name
    print INPUT_NAME
    name = gets.chomp
    name = NO_NAME if name.to_s.empty?
    name
  end

  def board(player, dealer, bank)
    close_cards(dealer)
    puts show_bank(bank)
    open_cards(player)
  end

  def close_cards(player)
    puts DOUBLE_LINE
    puts name_cash(player)
    puts hidden_cards(player)
    puts ODD_LINE
  end

  def open_cards(player)
    puts ODD_LINE
    puts name_cash(player)
    puts show_cards(player)
    puts player.sum_cards
    puts DOUBLE_LINE
  end

  def player_menu
    puts CHOICE_BUTTON
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

  def no_money
    pause
    puts NO_MONEY
  end

  def yes
    YES
  end

  def max_cards
    puts MAX_CARDS
    pause
  end

  def max_cards_dealer
    puts MAX_CARDS_DEALER
    pause
  end

  def auto_open_cards
    puts AUTO_OPEN_CARDS
    pause
  end


  def opening_cards
    puts OPEN_CARDS
    pause
  end

  def showdown(player, dealer)
    puts DOUBLE_LINE
    puts SHOWDOWN
    open_cards(dealer)
    open_cards(player)
  end

  def end_game
    print PLAY_AGAIN
    gets.chomp.upcase
  end

  private

  def name_cash(player)
    player.name + ": #{player.cash}" + DOLLAR_SYM
  end

  def hidden_cards(player)
    player.cards.map {'🂠'}.join(' ')
  end

  def show_cards(player)
    player.cards.map { |card| card.rank.to_s + card.suit }.join(' ')
  end

  def show_bank(bank)
    BANK + bank.bank.to_s + DOLLAR_SYM
  end

  def pause
    sleep(2)
  end
end
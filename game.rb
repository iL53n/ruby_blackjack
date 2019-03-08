require_relative './player'
require_relative './dealer'
require_relative './user'
require_relative './card'
require_relative './deck'
require_relative './bank'
require_relative './interface'

class Game

  attr_reader :player, :dealer, :bank

  ACTIONS = %i[add_card pass open]

  def initialize
    @bank = 0
    start_game
  end

  def start_game
    @interface = Interface.new
    create_player
    @dealer = Dealer.new
    @bank = Bank.new
    new_deal
  end

  private

  def create_player
    name = @interface.ask_name
    @player = User.new(name)
  end

  def new_deal
    new_deck
    start_cards
    @bank.auto_bet(@player, @dealer)
    interface_board
    game_round
    end_game
  end

  def game_round
    loop do
      action = move_player # Ход игрока возвращает выбранное действие(action)
      return @interface.opening_cards if action == :open

      move_dealer
      return @interface.auto_open_cards if round_ended?
    end
  end

  def move_player
    action_index = @interface.choice_player - 1
    action = ACTIONS[action_index]

    if action == :add_card
      deal_card(@player)
      @interface.open_cards(@player)
    end
    action
  end

  def move_dealer
    if @dealer.can_take_card?
      deal_card(@dealer)
      @interface.add_dealer
    else
      @interface.pass_dealer
    end
    interface_board
  end

  def deal_card(player)
    return unless player.can_take_card?

    player.add_card(new_card)
  end

  def interface_board
    @interface.board(@player, @dealer, @bank)
    @interface.player_menu
  end

  def new_deck
    @deck = Deck.new
  end

  def start_cards
    2.times do
      @player.add_card(new_card)
      @dealer.add_card(new_card)
    end
  end

  def new_card
    @deck.new_card
  end

  def drop_cards
    @player.fold_cards
    @dealer.fold_cards
  end

  def round_ended?
    !(@dealer.can_take_card? || @player.can_take_card?)
  end

  def rep_game
    if @bank.have_money?(@dealer) && @bank.have_money?(@player)
      input = @interface.end_game
      input == @interface.yes ? new_deal : exit
    else
      @interface.no_money
    end
  end

  def definition_winner
    return if @player.sum_cards > Hand::BLACK_JACK && @dealer.sum_cards > Hand::BLACK_JACK
    return if @player.sum_cards == @dealer.sum_cards
    return @player if @dealer.sum_cards > Hand::BLACK_JACK
    return @dealer if @player.sum_cards > Hand::BLACK_JACK

    [@player, @dealer].max_by(&:sum_cards)
  end

  def deal_result
    case definition_winner
    when @player
      @bank.winner(@player)
      @interface.player_win
    when @dealer
      @bank.winner(@dealer)
      @interface.dealer_win
    else
      @bank.draw(@player, @dealer)
      @interface.draw_info
    end
    drop_cards
  end

  def end_game
    @interface.showdown(@player, @dealer)
    deal_result
    rep_game
  end
end
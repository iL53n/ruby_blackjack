require_relative './player'
require_relative './dealer'
require_relative './user'
require_relative './card'
require_relative './deck'
require_relative './bank'
require_relative './interface'

class Game

  attr_reader :player, :dealer, :bank

  def initialize
    @bank = 0
    start_game
  end

  def start_game
    @interface = Interface.new
    @player = User.new(@interface.player_name)
    @dealer = Dealer.new
    @bank = Bank.new
    new_deal
  end

  def new_deal
    new_deck
    start_cards
    @bank.auto_bet(@player, @dealer)
    @interface.board(@player, @dealer, @bank)
    @interface.player_menu
    move_player
    @interface.showdown(@player, @dealer)
    deal_result
    rep_game
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
    @deck.cards.pop
  end

  def drop_cards
    @player.hand.cards = []
    @dealer.hand.cards = []
  end

  def move_player
    input = @interface.choice_player

    case input
    when 1
      @player.add_card(new_card)
      @interface.board(@player, @dealer, @bank)
      move_dealer
    when 2
      move_dealer
    end
  end

  def move_dealer
    @interface.choice_dealer
    if @dealer.sum_cards < 17
      @dealer.add_card(new_card)
      @interface.add_dealer
    else
      @interface.pass_dealer
    end
  end

  def rep_game
    if @bank.have_money?(@dealer) && @bank.have_money?(@player)
      input = @interface.end_game
      input == "Y" ? new_deal : exit
    else
      @interface.no_money
    end
  end

  def definition_winner #return winner or draw
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
end
require_relative './player'
require_relative './dealer'
require_relative './user'
require_relative './card'
require_relative './deck'
require_relative './bank'

class Game

  attr_reader :player, :dealer, :bank

  def initialize
    @bank = 0
    start_game
  end

  def start_game
    @player = User.new
    @dealer = Dealer.new
    @bank = Bank.new
    new_deal
  end

  def new_deal
    drop_cards
    new_deck
    start_cards
    @bank.auto_bet(@player, @dealer)
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
    @player.hand = []
    @dealer.hand = []
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
    when @dealer
      @bank.winner(@dealer)
    else
      @bank.draw(@player, @dealer)
    end
    drop_cards
  end
end
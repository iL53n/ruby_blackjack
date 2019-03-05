require_relative './player'
require_relative './dealer'
require_relative './user'
require_relative './card'
require_relative './deck'

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
    clear
    new_deck
    2.times do
      @player.add_card(new_card)
      @dealer.add_card(new_card)
    end
    @bank.auto_bet(@player, @dealer)
  end

  def new_deck
    @deck = Deck.new
  end

  def new_card
    @deck.pop
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
      if difference.zero?
        draw_no_winner
      elsif difference.positive?
        player_winner
      else difference.negative?
        dealer_winner
      end
    end

    end_game
  end

  # def not_money?
  #   @player.cash.nil? || @dealer.cash.nil?
  # end



  def clear
    @bank = 0
    @player.cards = []
    @dealer.cards = []
  end
end
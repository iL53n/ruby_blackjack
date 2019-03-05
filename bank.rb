class Bank
  BET = 10

  attr_reader :bank

  def initialize
    @bank = 0
  end

  def auto_bet(player, dealer)
    player.cash -= BET
    dealer.cash -= BET
    @bank = BET * 2
  end

  def winner(player)
    player.cash += @bank
    @bank = 0
  end

  def draw(player, dealer)
    player.cash += @bank / 2
    dealer.cash += @bank / 2
    @bank = 0
  end

  def have_money?(player)
    player.cash > BET
  end
end
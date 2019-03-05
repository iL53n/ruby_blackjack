class Interface
  PLAYER_WIN = "YOU WIN !!!".freeze
  DEALER_WIN = "YOU LOSE !!!".freeze
  BUST = "BUST".freeze
  DRAW = "DRAW".freeze
  SHOWDOWN = "-= SHOWDOWN =-".freeze




  def board
    puts "================================"
    puts @dealer.name
    puts @dealer.hidden_cards
    puts "Cash: #{@dealer.cash}$"
    puts "--------------------------------"
    puts "Bank: #{@bank}$"
    puts "--------------------------------"
    puts @player.name
    @player.show_cards
    puts "( #{@player.sum_cards} )"
    puts "Cash: #{@player.cash}$"
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
    end
  end

  def choice_dealer
    puts "Choice dealer ..."
    #sleep(2)
    @dealer.add_card(new_card) if @dealer.sum_cards < 17
    board
    showdown
  end

  def showdown
    puts SHOWDOWN
    puts @dealer.name
    @dealer.show_cards
    puts "( #{@dealer.sum_cards} )"
    puts @player.name
    @player.show_cards
    puts "( #{@player.sum_cards} )"
    definition_winner
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
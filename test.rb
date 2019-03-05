require_relative './player'
require_relative './user'
require_relative './dealer'
require_relative './game'

game = Game.new
game.start_game
game.new_deal
game.new_deck
game.start_cards
game.new_card
game.drop_cards
game.definition_winner
game.deal_result


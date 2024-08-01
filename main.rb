# requirements
require_relative 'lib/board'

# main

new_game = Game.new
new_game.update_board(1, 'X')
new_game.update_board(3, 'O')
new_game.update_board(5, 'O')
new_game.update_board(7, 'O')
new_game.display_board
p new_game.data
p new_game.winner?

# game loop will be implemented here and I need a Player class to generate two players

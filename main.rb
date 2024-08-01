# requirements
require_relative 'lib/board'

# main

new_game = Game.new
new_game.update_board(9, 'X')
new_game.update_board(8, 'X')
new_game.update_board(6, 'X')
new_game.update_board(2, 'O')
new_game.update_board(3, 'O')
new_game.update_board(5, 'O')
new_game.display_board

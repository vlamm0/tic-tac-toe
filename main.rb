# requirements
require_relative 'lib/board'
require_relative 'lib/player'
CHOICES = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze

def validate_input(new_game, player)
  player.prompt
  input = gets.chomp
  unless CHOICES.include?(input.to_i)
    validate_input(new_game, player)
    return
  end

  # new_game.curr_player.prompt until CHOICES.include?(response.chomp.to_i)
  new_game.update_board(input.to_i, player.icon)
  new_game.turn = new_game.turn + 1
  go(new_game)
  # new_game.display_board
end

def go(new_game)
  new_game.display_board
  player = new_game.curr_player
  validate_input(new_game, player)
end

# main

new_game = Game.new
go(new_game)
# new_game.update_board(1, 'X')
# new_game.update_board(3, 'O')
# new_game.update_board(5, 'O')
# new_game.update_board(7, 'O')
# new_game.display_board
# p new_game.data
# p new_game.winner?

# game loop will be implemented here and I need a Player class to generate two players

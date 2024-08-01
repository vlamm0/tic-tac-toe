# requirements
require_relative 'lib/board'
require_relative 'lib/player'
CHOICES = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze

def win_screen(new_game)
  puts '***GAME OVER***'
  puts "PLAYER_#{new_game.curr_player.player} WINS!!"
  new_game.display_board
end

def mark_board(new_game, player, input)
  new_game.update_board(input, player.icon)
  if new_game.winner?
    win_screen(new_game)
  else
    new_game.turn += 1
    go(new_game)
  end
end

def check_choice(new_game, input, player)
  row, col = new_game.square_to_indexes(input)
  # base case
  return input if (new_game.data[row][col].is_a? Integer) && CHOICES.include?(input)

  # recurse
  puts "\n***Square #{input} is unavailabe, try again***\n"
  new_game.display_board
  validate_input(new_game, player)
end

def validate_input(new_game, player)
  player.prompt
  input = gets.chomp.to_i
  # can make this check choice & ensure it is an available square!
  check_choice(new_game, input, player)
end

def go(new_game)
  new_game.display_board
  player = new_game.curr_player
  input = validate_input(new_game, player)
  mark_board(new_game, player, input)
end

# main
go(Game.new)

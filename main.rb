# requirements
require_relative 'lib/board'
require_relative 'lib/player'
CHOICES = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze

# start next turn
def go(new_game)
  return "***GAME OVER****\n\n***~DRAW~***" if new_game.turn >= 9

  new_game.display_board
  player = new_game.curr_player
  input = validate_input(new_game, player)
  mark_board(new_game, player, input)
end

# gives prompt and gets player move
def validate_input(new_game, player)
  player.prompt
  input = gets.chomp.to_i
  check_choice(new_game, input, player)
end

# checks that player choice is valid and available
def check_choice(new_game, input, player)
  row, col = new_game.square_to_indexes(input)
  # base case
  return input if (new_game.data[row][col].is_a? Integer) && CHOICES.include?(input)

  # recurse
  puts "\n***Square #{input} is unavailabe, try again***\n"
  new_game.display_board
  validate_input(new_game, player)
end

# marks given available quadrant
def mark_board(new_game, player, input)
  new_game.update_board(input, player.icon)
  if new_game.winner?
    win_screen(new_game)
  else
    new_game.turn += 1
    go(new_game)
  end
end

# displays who won
def win_screen(new_game)
  puts '***GAME OVER***'
  puts "PLAYER_#{new_game.curr_player.player} WINS!!"
  new_game.display_board
end

# main
puts go(Game.new)

# requirements
require_relative 'lib/board'

# main

new_game = Game.new
p new_game.data
new_game.update_board(8, 'O')
new_game.display_board

# attempt to draw board with ruby
# top_line = '_' * 17
# puts " #{top_line} "

# 3.times do |row|
#   3.times do |number|
#     # this could be used to draw the row to keep method shorter
#     formula = new_game.data[row]
#     case number
#     when 0
#       puts '|     |     |     |'
#     when 1
#       puts "|  #{formula[0]}  |  #{formula[1]}  |  #{formula[2]}  |"
#     when 2
#       puts '|_____|_____|_____|'
#     end
#   end
# end

p new_game.data

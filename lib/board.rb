# game board
class Game
  attr_accessor :data

  def initialize
    self.data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def update_board(square, icon)
    row, column = square_to_indexes(square)
    data[row][column] = icon
  end

  # decodes square given by user and returns how that position is stored in data
  def square_to_indexes(square)
    row = (square - 1) / 3
    col = (square - 1) % 3
    [row, col]
  end

  def display_board
    top_line = '_' * 17
    puts " #{top_line} "
    3.times do |row|
      draw_row(row)
    end
  end

  # could possibly change this to a loop using an array to store differences
  def draw_row(row)
    formula = data[row]
    puts '|     |     |     |'
    puts "|  #{formula[0]}  |  #{formula[1]}  |  #{formula[2]}  |"
    puts '|_____|_____|_____|'
  end
end

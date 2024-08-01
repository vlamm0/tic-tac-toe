# game board
class Game
  attr_accessor :data

  def initialize
    self.data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def update_board(square, icon)
    row, column = square_to_indexes(square)
    data[row][column] = icon
    p data
  end

  # decodes square given by user and returns how that position is stored in data
  def square_to_indexes(square)
    row = square / 3
    col = (square - 1) % 3
    [row, col]
  end

  def display_board
    top_line = '_' * 17
    puts " #{top_line} "
    3.times do |row|
      3.times do |number|
        draw_row(row, number)
      end
    end
  end

  def draw_row(row, number)
    formula = data[row]
    case number
    when 0
      puts '|     |     |     |'
    when 1
      puts "|  #{formula[0]}  |  #{formula[1]}  |  #{formula[2]}  |"
    when 2
      puts '|_____|_____|_____|'
    end
  end
end

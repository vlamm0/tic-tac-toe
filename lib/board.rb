# game board
class Game
  attr_accessor :data, :players, :turn

  def initialize
    self.data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    self.players = [Player.new, Player.new]
    self.turn = 0
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

  # draws top line and 3 rows
  def display_board
    top_line = '_' * 17
    puts " #{top_line} "
    3.times do |row|
      draw_row(row)
    end
    true
  end

  # draws 3 slightly different segments to make comprehensible row
  def draw_row(row)
    formula = data[row]
    puts '|     |     |     |'
    puts "|  #{formula[0]}  |  #{formula[1]}  |  #{formula[2]}  |"
    puts '|_____|_____|_____|'
  end

  # checks all justificatory paths for winner
  def winner?
    col = [[], [], []]
    data.each do |row|
      return true if check_row(row) || check_col(row, col)
    end
    check_cross
  end

  # checks for row match
  def check_row(row)
    match?(row)
  end

  # checks for column match
  def check_col(row, col)
    3.times do |i|
      col[i].push(row[i])
      return true if match?(col[i])
    end
    false
  end

  # checks for diagonal match
  def check_cross
    match?(left_cross) || match?(right_cross)
  end

  # 2 diagonal lines' data
  def left_cross
    [data[0][0], data[1][1], data[2][2]]
  end

  def right_cross
    [data[0][2], data[1][1], data[2][0]]
  end

  # match? method which checks a justificatory arr and checks that is match is
  def match?(justificatory_arr)
    [%w[X X X], %w[O O O]].include?(justificatory_arr)
  end

  def curr_player
    turn.even? ? players[0] : players[1]
  end
end

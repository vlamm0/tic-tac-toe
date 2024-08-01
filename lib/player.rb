# a player for the tic tac toe game
class Player
  @@num_players = 0
  attr_accessor :icon, :player

  def initialize
    @@num_players += 1
    self.player = @@num_players == 1 ? '1' : '2'
    self.icon = @@num_players == 1 ? 'X' : 'O'
  end

  def prompt
    puts "\n\nIt is PLAYER_#{player}'s turn"
    puts 'Which square do you want 1-9?'
  end
end

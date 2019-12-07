class Board
  attr_accessor :state
  
  def initialize
    @state = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  
  def draw
    puts ""
    puts "| #{state[0]} | #{state[1]} | #{state[2]} |"
    puts "-------------"
    puts "| #{state[3]} | #{state[4]} | #{state[5]} |"
    puts "-------------"
    puts "| #{state[6]} | #{state[7]} | #{state[8]} |"
    puts ""
  end

  def update_state(player, field)
    state[field - 1] = player
  end
end
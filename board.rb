class Board  
  attr_reader :state
  
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

  def player_won?(player_marker)
    
    win_combos.each do |combo|
      match = 0

      combo.each do |field|
        if state[field - 1] == player_marker
          match += 1
        else
          match = 0
        end
      end
      
      return true if match == 3
    end

    return false
  end

  private
  attr_writer :state
  attr_reader :win_combos

  def initialize
    @state = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @win_combos = [
                  [1, 2, 3], [4, 5, 6], [7, 8, 9],
                  [1, 4, 7], [2, 5, 8], [3, 6, 9],
                  [3, 5, 7], [1, 5, 9]]
  end
end
require_relative 'board'
require_relative 'player'

class Game

  def start_game
    puts "Welcome to Tic Tac Toe"
    
    play_turn until game_over
  end

  private
  attr_accessor :choice, :current_player, :game_over, :picked_fields
  attr_reader :board, :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @current_player = player1
    @picked_fields = []
    @game_over = false
  end

  def play_turn
    puts ""
    puts "What field would you like to pick #{current_player.marker}?"
    board.draw

    begin
      @choice = gets.chomp.to_i

      raise StandardError.new "Number out of range" unless 0 < choice && choice < 10
      raise StandardError.new "Field already in use" if picked_fields.include?(choice)
    rescue StandardError=>e
      puts ""
      puts e
      puts "Pick a number from 1 to 9, #{current_player.marker}!"
      board.draw
      retry
    else
      picked_fields.push(choice)      
      board.update_state(current_player.marker, choice)
      
      end_game { puts "#{current_player.marker} WON THE GAME!!!" } if board.player_won?(current_player.marker)
      end_game { puts "It was a tie!" } unless board.state.any? { |element| element.is_a? Integer }
      
      switch_player
    end 
  end

  def end_game
    board.draw
    self.game_over = true
    yield
    
    new_game?
  end

  def new_game?
    puts ""
    puts "Would you like to start a new game? (y/n)"
    new_game_choice = gets.chomp

    if new_game_choice == "y"
      initialize
      start_game
    end 
  end

  def switch_player
    current_player == player1 ? self.current_player = player2 : self.current_player = player1
  end
end

game = Game.new
game.start_game
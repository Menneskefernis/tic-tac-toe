require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :choice, :player1, :player2, :current_player, :game_over

  def initialize
    @board = Board.new
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @current_player = player1
    @game_over = false
  end

  def start
    puts "Welcome to Tic Tac Toe"
    
    take_turn until game_over
  end

  def take_turn
    puts "What field would you like to pick #{current_player.marker}?"
    board.draw

    begin
      @choice = gets.chomp.match(/[1-9]/)[0].to_i
    rescue
      puts "Pick a number from 1 to 9!"
      board.draw
      retry
    else
      board.update_state(current_player.marker, choice)
      self.game_over = true if board.player_won?(current_player.marker)

      switch_player
    end 
  end

  def switch_player
    current_player == player1 ? self.current_player = player2 : self.current_player = player1
  end
end

game = Game.new
game.start
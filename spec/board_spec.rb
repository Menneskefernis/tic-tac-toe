require './board'

describe Board do
  describe "#player_won?" do
    it "returns true if a player got three marker on first row" do
      board = Board.new
      board.state[0] = "X"
      board.state[1] = "X"
      board.state[2] = "X"
      
      expect(board.player_won?("X")).to eql(true)
    end

    it "returns false if player don't have three in a row" do
      board = Board.new
      board.state[0] = "X"
      board.state[4] = "X"
      board.state[6] = "X"
      board.state[9] = "X"
      
      expect(board.player_won?("X")).to eql(false)
    end
  end

  describe "#update_state" do
    it "updates the state of the board" do
      board = Board.new
      board.update_state("X", 5)
      expect(board.state).to eql([1, 2, 3, 4, "X", 6, 7, 8, 9])
    end
  end
end
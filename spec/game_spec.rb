require './game'

describe Game do
  describe "#switch_player" do
    it "switches the player" do
      game = Game.new
      game.current_player = game.player1
      game.switch_player
      
      expect(game.current_player).to eql(game.player2)
    end
  end

  it "returns canned responses from the methods named in the provided hash" do
    dbl = double("Some Collaborator", :foo => 3, :bar => 4)
    expect(dbl.foo).to eq(3)
    expect(dbl.bar).to eq(4)
  end
end
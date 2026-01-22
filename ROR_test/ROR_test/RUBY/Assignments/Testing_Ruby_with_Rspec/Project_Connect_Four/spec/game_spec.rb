require_relative "../lib/game"

RSpec.describe Game do
  it "detects a horizontal win" do
    game = Game.new
    4.times { |i| game.board.drop_piece(i, "X") }
    expect(game.winner?).to be true
  end
end

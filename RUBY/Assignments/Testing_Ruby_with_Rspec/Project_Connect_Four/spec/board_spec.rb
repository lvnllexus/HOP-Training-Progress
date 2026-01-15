require_relative "../lib/board"

RSpec.describe Board do
  subject(:board) { described_class.new }

  it "creates a 6x7 grid" do
    expect(board.grid.size).to eq(6)
    expect(board.grid.first.size).to eq(7)
  end

  it "drops a piece into the lowest available row" do
    board.drop_piece(0, "X")
    expect(board.grid[5][0]).to eq("X")
  end

  it "returns false when a column is full" do
    6.times { board.drop_piece(0, "X") }
    expect(board.drop_piece(0, "O")).to be false
  end
end

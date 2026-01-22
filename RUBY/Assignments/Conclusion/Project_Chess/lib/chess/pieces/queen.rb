require_relative 'rook'
require_relative 'bishop'

module Chess
  class Queen < Piece
    def symbol
      color == :white ? "♕" : "♛"
    end

    def valid_move?(from, to, _board)
      Rook.new(color).valid_move?(from, to, nil) ||
      Bishop.new(color).valid_move?(from, to, nil)
    end
  end
end

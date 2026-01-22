require_relative 'piece'

module Chess
  class King < Piece
    def symbol
      color == :white ? "♔" : "♚"
    end

    def valid_move?(from, to, _board)
      (from[0] - to[0]).abs <= 1 && (from[1] - to[1]).abs <= 1
    end
  end
end

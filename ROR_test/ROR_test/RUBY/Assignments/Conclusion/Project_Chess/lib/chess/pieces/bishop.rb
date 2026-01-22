require_relative 'piece'

module Chess
  class Bishop < Piece
    def symbol
      color == :white ? "♗" : "♝"
    end

    def valid_move?(from, to, _board)
      (from[0] - to[0]).abs == (from[1] - to[1]).abs
    end
  end
end

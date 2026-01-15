require_relative 'piece'

module Chess
  class Knight < Piece
    def symbol
      color == :white ? "♘" : "♞"
    end

    def valid_move?(from, to, _board)
      dx = (from[0] - to[0]).abs
      dy = (from[1] - to[1]).abs
      [dx, dy].sort == [1, 2]
    end
  end
end

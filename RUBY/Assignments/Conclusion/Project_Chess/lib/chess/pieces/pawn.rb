require_relative 'piece'

module Chess
  class Pawn < Piece
    def symbol
      color == :white ? "♙" : "♟"
    end

    def valid_move?(from, to, board)
      direction = color == :white ? -1 : 1
      fx, fy = from
      tx, ty = to

      fy == ty && board.grid[tx][ty].nil? && tx == fx + direction
    end
  end
end

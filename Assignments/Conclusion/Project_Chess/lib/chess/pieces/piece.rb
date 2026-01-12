module Chess
  class Piece
    attr_reader :color

    def initialize(color)
      @color = color
    end

    def valid_move?(_from, _to, _board)
      false
    end
  end
end

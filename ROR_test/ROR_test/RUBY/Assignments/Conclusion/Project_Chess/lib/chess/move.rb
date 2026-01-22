module Chess
  class Move
    attr_reader :from, :to

    def initialize(input)
      @from, @to = parse(input)
    end

    def valid?
      from && to
    end

    private

    def parse(input)
      squares = input.split
      return [nil, nil] unless squares.length == 2

      squares.map do |square|
        col = square[0].ord - 97
        row = 8 - square[1].to_i
        return [nil, nil] unless (0..7).cover?(row) && (0..7).cover?(col)
        [row, col]
      end
    end
  end
end

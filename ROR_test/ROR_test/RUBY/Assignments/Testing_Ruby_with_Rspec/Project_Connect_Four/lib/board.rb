class Board
  ROWS = 6
  COLUMNS = 7
  EMPTY = " "

  attr_reader :grid

  def initialize
    @grid = Array.new(ROWS) { Array.new(COLUMNS, EMPTY) }
  end

  def drop_piece(column, symbol)
    (ROWS - 1).downto(0) do |row|
      if @grid[row][column] == EMPTY
        @grid[row][column] = symbol
        return true
      end
    end
    false
  end

  def full?
    @grid.all? { |row| row.none?(EMPTY) }
  end

  def display
    puts "\n 1 2 3 4 5 6 7"
    puts "---------------"
    @grid.each do |row|
      puts row.map { |cell| cell == EMPTY ? "." : cell }.join(" ")
    end
    puts
  end
end

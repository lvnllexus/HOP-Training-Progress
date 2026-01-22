require_relative "board"
require_relative "player"

class Game
  attr_reader :board, :current_player, :players

  def initialize
    @board = Board.new
    @players = [
      Player.new("Player 1", "X"),
      Player.new("Player 2", "O")
    ]
    @current_player = @players.first
  end

  def winner?
    directions = [[0,1], [1,0], [1,1], [1,-1]] # horizontal, vertical, diagonal

    (0...Board::ROWS).each do |row|
      (0...Board::COLUMNS).each do |col|
        next if @board.grid[row][col] == Board::EMPTY
        directions.each do |dr, dc|
          return true if four_in_a_row?(row, col, dr, dc)
        end
      end
    end
    false
  end

  def switch_player
    @current_player = @players.find { |p| p != @current_player }
  end

  private

  def four_in_a_row?(row, col, dr, dc)
    symbol = @board.grid[row][col]

    4.times.all? do |i|
      r = row + dr * i
      c = col + dc * i
      r.between?(0, Board::ROWS - 1) &&
        c.between?(0, Board::COLUMNS - 1) &&
        @board.grid[r][c] == symbol
    end
  end
end

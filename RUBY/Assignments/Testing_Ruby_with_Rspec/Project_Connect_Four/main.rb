require_relative "lib/game"

class ConnectFourCLI
  def initialize
    @game = Game.new
  end

  def start
    puts "Welcome to Connect Four!"
    loop do
      @game.board.display
      take_turn
      if @game.winner?
        @game.board.display
        puts "#{@game.current_player.name} wins! Congratulations!"
        break
      elsif @game.board.full?
        @game.board.display
        puts "It's a draw!"
        break
      else
        @game.switch_player
      end
    end
  end

  private

  def take_turn
    puts "#{@game.current_player.name} (#{@game.current_player.symbol}), choose a column (1-7):"
    column = gets.chomp.to_i - 1

    until (0..6).include?(column) && @game.board.drop_piece(column, @game.current_player.symbol)
      puts "Invalid move. Try again:"
      column = gets.chomp.to_i - 1
    end
  end
end

ConnectFourCLI.new.start


=begin 
To run the game, save this file as `main.rb` and execute it with Ruby:
ruby main.rb

Instructions:
1. Enter a column number (1-7) to drop a piece in that column.
2. The game board will be displayed after each move.
3. The game ends when a player wins or when the board is full.
Enjoy playing Connect Four!
=end
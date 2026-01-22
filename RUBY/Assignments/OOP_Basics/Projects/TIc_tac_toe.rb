# The Tic Tac Toe Object Model

puts "Rails project file ready!"


# ==============================
# The Tic Tac Toe Object Model
# ==============================

#Remember Tic Tac Toe (also known as “Noughts and Crosses”)? It involves a couple of players, a board, checking for victory in a game loop… all the conditions that make it a fun little problem to solve using our newfound OOP sea legs. Let’s build it!
#Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

#Think about how you would set up the different elements within the game… What should be a class? Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.
#Build your game, taking care to not share information between classes any more than you have to.

class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @current_player = 'X'
  end

  def display_board
    puts "  0 1 2"
    @board.each_with_index do |row, index|
      puts "#{index} #{row.join('|')}"
      puts "  -----" unless index == 2
    end
  end

  def play
    until game_over?
      display_board
      puts "Player #{@current_player}, enter your move (row and column): "
      row, col = gets.chomp.split.map(&:to_i)
      if valid_move?(row, col)
        make_move(row, col)
        switch_player
      else
        puts "Invalid move. Try again."
      end
    end
    display_board
    puts "Game over! #{winner_message}"
  end

  private

  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && @board[row][col] == ' '
  end

  def make_move(row, col)
    @board[row][col] = @current_player
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def game_over?
    winner || board_full?
  end

  def winner
    # Check rows, columns, and diagonals for a win
    lines = @board + @board.transpose + [[@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]]]
    lines.each do |line|
      return line[0] if line.uniq.length == 1 && line[0] != ' '
    end
    nil
  end

  def board_full?
    @board.flatten.none? { |cell| cell == ' ' }
  end

  def winner_message
    if winner
      "Player #{winner} wins!"
    else
      "It's a tie!"
    end
  end
end

game = TicTacToe.new
game.play

#This is a basic implementation of a Tic Tac Toe game using OOP principles in Ruby. The `TicTacToe` class encapsulates all the functionality needed to play the game, including displaying the board, handling player moves, checking for a winner, and switching players.
#Players take turns entering their moves, and the game continues until there is a winner or the board is full (resulting in a tie).
#Feel free to expand upon this implementation by adding features such as input validation, a scoring system, or even an AI opponent!

#How to run:
# Save the code to a file named `Tic_tac_toe.rb` and run it using the command `ruby Tic_tac_toe.rb` in your terminal. Enjoy playing Tic Tac Toe!
  #Note: This implementation assumes that players will enter valid input (two integers separated by a space). You may want to add additional error handling for robustness.

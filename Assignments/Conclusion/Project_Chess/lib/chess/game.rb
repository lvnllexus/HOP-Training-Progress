require_relative 'board'
require_relative 'player'
require_relative '../serialization'

module Chess
  class Game
    attr_accessor :board, :current_player

    def initialize
      @board = Board.new
      @players = [
        Player.new(:white),
        Player.new(:black)
      ]
      @current_player = @players.first
    end

    def play
      loop do
        board.display
        puts "#{current_player.color.capitalize}'s turn"
        print "Enter move (e2 e4), 'save', 'load', or 'exit': "

        input = gets
        break if input.nil?

        input = input.chomp.strip

        if input.empty?
          puts "⚠️  No move entered. Please try again."
          next
        end

        case input.downcase
        when 'exit'
          puts "👋 Exiting game. Goodbye!"
          break

        when 'save'
          Serialization.save(self)
          next

        when 'load'
          game = Serialization.load
          @board = game.board
          @current_player = game.current_player
          next

        else
          from, to = input.split

          unless from && to
            puts "❌ Invalid input format. Use: e2 e4"
            next
          end

          unless board.move_piece(from, to, current_player.color)
            puts "❌ Illegal move. Try again."
            next
          end

          switch_player

          if board.checkmate?(current_player.color)
            board.display
            puts "♚ Checkmate! #{opponent.color.capitalize} wins!"
            break
          end
        end
      end
    end

    private

    def switch_player
      @current_player = opponent
    end

    def opponent
      @players.find { |p| p != current_player }
    end
  end
end

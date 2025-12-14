# MasterMind Game Implementation in Ruby

puts "Rails project file ready!"


# ==============================
# MasterMind Game Implementation in Ruby
# ==============================

#Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer’s random code.
#Think about how you would set this problem up!
#Build the game assuming the computer randomly selects the secret colors and the human player must guess them. Remember that you need to give the proper feedback on how good the guess was each turn!
#Now refactor your code to allow the human player to choose whether they want to be the creator of the secret code or the guesser.
#Build it out so that the computer will guess if you decide to choose your own secret colors. You may choose to implement a computer strategy that follows the rules of the game or you can modify these rules.
#If you choose to modify the rules, you can provide the computer additional information about each guess. For example, you can start by having the computer guess randomly, but keep the ones that match exactly. You can add a little bit more intelligence to the computer player so that, if the computer has guessed the right color but the wrong position, its next guess will need to include that color somewhere.
class MasterMind
  COLORS = %w[R G B Y O P]
  CODE_LENGTH = 4
  MAX_TURNS = 12

  def initialize
    @secret_code = Array.new(CODE_LENGTH) { COLORS.sample }
    @turns = 0
  end

  def play
    puts "Welcome to MasterMind!"
    until @turns >= MAX_TURNS
      puts "Turn #{@turns + 1}/#{MAX_TURNS}: Enter your guess (e.g., RGBY):"
      guess = gets.chomp.upcase.chars
      if valid_guess?(guess)
        feedback = evaluate_guess(guess)
        puts "Feedback: #{feedback[:correct_position]} correct position(s), #{feedback[:correct_color]} correct color(s)"
        if feedback[:correct_position] == CODE_LENGTH
          puts "Congratulations! You've guessed the secret code!"
          return
        end
        @turns += 1
      else
        puts "Invalid guess. Please use #{CODE_LENGTH} colors from #{COLORS.join(', ')}."
      end
    end
    puts "Game over! The secret code was #{@secret_code.join}."
  end

  private

  def valid_guess?(guess)
    guess.length == CODE_LENGTH && guess.all? { |color| COLORS.include?(color) }
  end

  def evaluate_guess(guess)
    correct_position = 0
    correct_color = 0
    secret_code_copy = @secret_code.dup
    guess_copy = guess.dup

    # First pass: check for correct positions
    guess.each_with_index do |color, index|
      if color == @secret_code[index]
        correct_position += 1
        secret_code_copy[index] = nil
        guess_copy[index] = nil
      end
    end

    # Second pass: check for correct colors in wrong positions
    guess_copy.compact.each do |color|
      if secret_code_copy.include?(color)
        correct_color += 1
        secret_code_copy[secret_code_copy.index(color)] = nil
      end
    end

    { correct_position: correct_position, correct_color: correct_color }
  end
end

# To start the game, uncomment the line below:
# MasterMind.new.play #This one?, yes this one 
    if winner
    "Player #{winner} wins!"
  else
    "It's a draw!"
  end
end
end

#To run the game, Open a terminal and navigate to the directory containing this file. Then run:
#ruby MasterMind.rb
# Enjoy playing MasterMind!

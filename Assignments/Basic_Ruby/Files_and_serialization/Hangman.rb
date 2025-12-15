# Hangman Rails project file

puts "Rails project file ready!"


# ==============================
# Hangman Rails project file
# ==============================

#You will be building a command line Hangman game where one player plays against the computer, but a bit more advanced.
#Download the google-10000-english-no-swears.txt dictionary file from the first20hours GitHub repository google-10000-english.
#When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.
#You don’t need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses they have before the game ends. You should also display which correct letters have already been chosen (and their position in the word, e.g. _ r o g r a _ _ i n g) and which incorrect letters have already been chosen.
#Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect. If out of guesses, the player should lose.
#Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game. Remember what you learned about serializing objects.
#When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved. Play on!

# hangman.rb
# Ruby Hangman Game (CLI)
# Features:
# - Loads words from a dictionary txt file
# - Picks a random word (5–12 chars)
# - Tracks guesses and remaining turns
# - Save / Load game using YAML serialization
#.- To save it, first enter the game and when the statement "Guess a letter or type 'save': " appears, type 'save' and hit enter.

require 'yaml'

class Hangman
  MAX_WRONG_GUESSES = 6
  SAVE_FILE = 'hangman_save.yml'

  attr_reader :secret_word, :display_word, :guessed_letters, :wrong_guesses

  def initialize(dictionary_path)
    @dictionary_path = dictionary_path
    words = load_dictionary
    @secret_word = words.sample.downcase
    @display_word = Array.new(@secret_word.length, '_')
    @guessed_letters = []
    @wrong_guesses = []
  end

  # ---------------- FILES ----------------
  def load_dictionary
    words = File.read(@dictionary_path).split("\n")
    words.select { |w| w.length.between?(5, 12) }
  rescue Errno::ENOENT
    puts "Dictionary file not found. Make sure the txt file is in this folder."
    exit
  end

  def save_game
    data = {
      secret_word: @secret_word,
      display_word: @display_word,
      guessed_letters: @guessed_letters,
      wrong_guesses: @wrong_guesses
    }

    File.open(SAVE_FILE, 'w') { |file| file.write(YAML.dump(data)) }
    puts "Game saved successfully!"
  end

  def self.load_game
  data = YAML.load(File.read(SAVE_FILE))

  game = allocate
  game.instance_variable_set(:@secret_word, data[:secret_word])
  game.instance_variable_set(:@display_word, data[:display_word])
  game.instance_variable_set(:@guessed_letters, data[:guessed_letters])
  game.instance_variable_set(:@wrong_guesses, data[:wrong_guesses])
  game.instance_variable_set(:@dictionary_path, 'google-10000-english-no-swears.txt')

  game
rescue Errno::ENOENT
  puts "No saved game found."
  nil
end

  # ---------------- GAME LOGIC ----------------
  def play
    puts "\nWelcome to Hangman!"

    until game_over?
      show_status
      input = player_input

      if input == 'save'
        save_game
        return
      end

      process_guess(input)
    end

    end_game_message
  end

  def show_status
    puts "\nWord: #{display_word.join(' ')}"
    puts "Wrong guesses: #{wrong_guesses.join(', ')}"
    puts "Remaining attempts: #{MAX_WRONG_GUESSES - wrong_guesses.size}"
  end

  def player_input
    loop do
      print "Guess a letter or type 'save': "
      input = gets.chomp.downcase

      return input if input == 'save'

      if input.match?(/^[a-z]$/) && !guessed_letters.include?(input)
        guessed_letters << input
        return input
      end

      puts "Invalid input or already guessed. Try again."
    end
  end

  def process_guess(letter)
    if secret_word.include?(letter)
      secret_word.chars.each_with_index do |char, index|
        display_word[index] = char if char == letter
      end
    else
      wrong_guesses << letter
    end
  end

  def game_over?
    won? || lost?
  end

  def won?
    !display_word.include?('_')
  end

  def lost?
    wrong_guesses.size >= MAX_WRONG_GUESSES
  end

  def end_game_message
    if won?
      puts "\n Congratulations! You guessed the word: #{secret_word}"
    else
      puts "\n Game Over! The word was: #{secret_word}"
    end
  end
end

# ---------------- PROGRAM START ----------------
puts "Do you want to load a saved game? (y/n)"
choice = gets.chomp.downcase

if choice == 'y'
  game = Hangman.load_game
  game.play if game
else
  game = Hangman.new('google-10000-english-no-swears.txt')
  game.play
end


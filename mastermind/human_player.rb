# frozen_string_literal: true

$LOAD_PATH << '.'

require 'utils'
require 'game'

class HumanPlayer < Game
  def initialize
    super choose_random_sequence
    p combination
  end

  def play
    puts 'The sequence has been choosen. It\'s your turn now. Try guess it! Remember, you only have 12 guesses'
    guessed = false
    12.times do |turn|
      puts "Turn #{turn + 1}"
      print_colors
      puts 'Write your guess'
      input = gets.chomp
      array_input = valid_input(input)
      result = check(array_input)
      puts result
      if array_input == combination
        guessed = true
        break
      end
    end
    guessed ? print_win(true) : print_loss(true)
  end
end

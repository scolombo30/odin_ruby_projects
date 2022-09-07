# frozen_string_literal: true

$LOAD_PATH << '.'

require 'utils'
require 'game'

class HumanPlayer < Game
  def initialize
    # crea combinazione a random e passala al costruttore di super e poi fai partire con play()
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
    guessed ? print_win : print_loss
  end

  def valid_input(input)
    array_input = []
    loop do
      array_input = input.split(' ').map!(&:to_i)
      break if array_input.size == 4 && array_input.all? { |el| el.to_i < 7 && el.to_i.positive? }

      puts 'Invalid input. Please re-insert'
      input = gets.chomp
    end
    array_input
  end

  def print_win
    puts 'Congrats, you crack the code!'
    print 'The solution was exactly: '
    puts print_correct_combination
  end

  def print_loss
    puts 'Oh-oh, you dind\'t crack the code'
    print 'The solution was: '
    puts print_correct_combination
  end
end

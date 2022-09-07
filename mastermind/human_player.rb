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
    12.times do |turn|
      puts "Turn #{turn + 1}"
      print_colors
      puts 'Write your guess'
      input = gets.chomp
      array_input = valid_input(input)
      result = check(array_input)
      puts result
      if array_input == combination
        print_win
        return
      end
    end
    print_loss
  end

  def valid_input(input)
    array_input = []
    loop do
      array_input = input.split(' ').map! {|el| el.to_i }
      break if array_input.size == 4 && array_input.all? { |el| el.to_i < 7 && el.to_i.positive? }

      puts 'Invalid input. Please re-insert'
      input = gets.chomp
    end
    array_input
  end

  def print_win
    puts 'Congrats, you crack the code!'
  end

  def print_loss
    puts 'Oh-oh, you dind\'t crack the code'
    print 'The solution was: '
    sequence = ''
    4.times do |i|
      case combination[i]
      when 1
        sequence << ColorizedString['  1  '].colorize(color: :black, background: :white).concat(' ')
      when 2
        sequence << ColorizedString['  2  '].colorize(color: :black, background: :cyan).concat(' ')
      when 3
        sequence << ColorizedString['  3  '].colorize(color: :black, background: :magenta).concat(' ')
      when 4
        sequence << ColorizedString['  4  '].colorize(color: :black, background: :yellow).concat(' ')
      when 5
        sequence << ColorizedString['  5  '].colorize(color: :black, background: :red).concat(' ')
      when 6
        sequence << ColorizedString['  6  '].colorize(color: :black, background: :blue).concat(' ')
      end
    end
    puts sequence
  end
end

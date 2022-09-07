# frozen_string_literal: true

module Utils
  def choose_random_sequence
    sequence = []
    4.times do |i|
      random = rand(1...6)
      sequence[i] = random
    end
    sequence
  end

  def choose_player
    puts 'Choose how you want to play (digit 1 or 2):'
    puts '1-The computer generates a sequence and you have to guess it'
    puts '2-You create a sequence and the computer will try to guess it'
    choice = ''
    loop do
      choice = gets.chomp
      break if %w[1 2].include?(choice)

      puts 'Invalid input(digit only 1 or 2). Try again'
    end
    choice
  end

  def print_colors
    print ColorizedString['  1  '].colorize(color: :black, background: :white).concat(' ')
    print ColorizedString['  2  '].colorize(color: :black, background: :cyan).concat(' ')
    print ColorizedString['  3  '].colorize(color: :black, background: :magenta).concat(' ')
    print ColorizedString['  4  '].colorize(color: :black, background: :yellow).concat(' ')
    print ColorizedString['  5  '].colorize(color: :black, background: :red).concat(' ')
    puts ColorizedString['  6  '].colorize(color: :black, background: :blue)
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

  def print_win(person)
    puts (person ? 'Congrats, you crack the code!' : 'Oh no, the pc cracked your code!').to_s
    print 'The solution was exactly: '
    puts print_correct_combination
  end

  def print_loss(person)
    puts (person ? 'Oh-oh, you dind\'t crack the code' : 'Congrats, the pc couldn\'t crak your code!').to_s
    print 'The solution was: '
    puts print_correct_combination
  end
end

# frozen_string_literal: true

module Utils
  def choose_random_sequence
    sequence = []
    4.times do |i|
      random = rand(1...6)
      sequence[i] = 1 if random == 1
      sequence[i] = 2 if random == 2
      sequence[i] = 3 if random == 3
      sequence[i] = 4 if random == 4
      sequence[i] = 5 if random == 5
      sequence[i] = 6 if random == 6
    end; sequence
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
end

# frozen_string_literal: true

module Utils
  def choose_random_sequence
    sequence = []
    4.times do |i|
      random = rand(0...5)
      sequence[i] = :white if random.zero?
      sequence[i] = :cyan if random == 1
      sequence[i] = :magenta if random == 2
      sequence[i] = :yellow if random == 3
      sequence[i] = :red if random == 4
      sequence[i] = :black if random == 5
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
    print ColorizedString['  0  '].colorize(color: :black, background: :white).concat(' ')
    print ColorizedString['  1  '].colorize(color: :black, background: :cyan).concat(' ')
    print ColorizedString['  2  '].colorize(color: :black, background: :magenta).concat(' ')
    print ColorizedString['  3  '].colorize(color: :black, background: :yellow).concat(' ')
    print ColorizedString['  4  '].colorize(color: :black, background: :red).concat(' ')
    puts ColorizedString['  5  '].colorize(color: :black, background: :blue)
  end
end

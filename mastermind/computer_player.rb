# frozen_string_literal: false

$LOAD_PATH << '.'

require 'utils'
require 'game'

class ComputerPlayer < Game

  def initialize
    puts 'Since you\'ll be the coder, please insert a 4 numbers code(separated with spaces)'
    input = valid_input(gets.chomp)
    super(input)
  end

  def play
    guessed = false
    12.times do |i|
      sequence = choose_random_sequence
      msg = i < 10 ? " #{i} turn, pc is trying #{format(sequence)}" : "#{i} turn, pc is trying #{format(sequence)}"
      puts msg
      if combination == sequence
        guessed = true
        break
      end
      sleep(1)
    end
    guessed ? print_win(false) : print_loss(false)
  end

  def format(sequence)
    seq = ''
    sequence.each do |el|
      case el
      when 1
        seq << ColorizedString['  1  '].colorize(color: :black, background: :white).concat(' ')
      when 2
        seq << ColorizedString['  2  '].colorize(color: :black, background: :cyan).concat(' ')
      when 3
        seq << ColorizedString['  3  '].colorize(color: :black, background: :magenta).concat(' ')
      when 4
        seq << ColorizedString['  4  '].colorize(color: :black, background: :yellow).concat(' ')
      when 5
        seq << ColorizedString['  5  '].colorize(color: :black, background: :red).concat(' ')
      when 6
        seq << ColorizedString['  6  '].colorize(color: :black, background: :blue).concat(' ')
      end
    end
    seq
  end
end

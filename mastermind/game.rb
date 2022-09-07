# frozen_string_literal: false

$LOAD_PATH << '.'

require 'colorized_string'
require 'utils'
class Game
  include Utils
  attr_reader :combination

  def initialize(combination)
    @combination = combination
  end

  private

  def check(guess)
    correct_spot = 0
    correct_color = 0
    (0..3).each do |i|
      correct_spot += 1 if guess[i] == combination[i]
      correct_color += 1 if combination.include?(guess[i]) && guess[i] != combination[i]
    end
    formatted_string({ spot: correct_spot, color: correct_color })
  end

  def formatted_string(hash)
    result = ''
    result << ColorizedString["  #{hash[:spot]}  "].colorize(color: :black, background: :green)
    result << " right colors in the right spot \n"
    result << ColorizedString["  #{hash[:color]}  "].colorize(color: :black, background: :light_blue)
    result << ' right colors in the wrong spot'
  end

  def print_correct_combination
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

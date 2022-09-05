# frozen_string_literal: false

$LOAD_PATH << './mastermind'

require 'colorized_string'
require 'utils'
class Game
  include Utils
  attr_reader :combination

  def initialize(combination)
    @combination = combination
  end

  def play
    # code before
    check([1, 1, 1, 1])
    # code after
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
end

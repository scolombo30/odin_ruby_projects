require 'colorized_string'
class Game
  attr_reader :combination

  def initialize(combination)
    @combination = combination
  end

  def check(guess)
    correct_spot = 0
    correct_color = 0
    for i in 0..3
      correct_spot += 1 if guess[i] == combination[i]
      correct_color += 1 if combination.include?(guess[i]) && guess[i] != combination[i]
    end
    formatted_string({ spot: correct_spot, color: correct_color })
  end

  def formatted_string(hash)
    result = ''
    result << ColorizedString["  #{hash[:spot]}  "].colorize(:color => :black, :background => :green)
    result << ' '
    result << ColorizedString["  #{hash[:spot]}  "].colorize(:color => :black, :background => :light_blue)
  end
end

c = [1,4,1,1]
g = [1,0,1,4]

game = Game.new(c)
puts game.check(g)

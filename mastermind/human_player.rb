$LOAD_PATH << '.'

require 'utils'
require 'game'

class HumanPlayer < Game
  def initialize
    #crea combinazione a random e passala al costruttore di super e poi fai partire con play()
    super choose_random_sequence
  end
end

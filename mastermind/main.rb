$LOAD_PATH << './mastermind'

require 'utils'
require 'instructions'
require 'game'

include Utils
include Instructions

Instructions.print_rules

# sequenza da chiedere in futuro
c = [1, 4, 1, 1]

game = Game.new(c)
puts game.play
p game.choose_random_sequence

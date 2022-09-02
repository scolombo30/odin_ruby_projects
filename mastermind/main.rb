$LOAD_PATH << './mastermind' 
require 'instructions'
require 'game'

include Instructions

Instructions.print_rules()

#sequenza da chiedere in futuro
c = [1, 4, 1, 1]

game = Game.new(c)
puts game.play
p game.choose_random_sequence

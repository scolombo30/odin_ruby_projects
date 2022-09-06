# frozen_string_literal: true

$LOAD_PATH << './mastermind'

require 'utils'
require 'instructions'
require 'game'

include Utils
include Instructions

print_rules
print_tutorial

choose_player == '1' ? player_guess : computer_guess

# sequenza da chiedere in futuro; c = [1, 4, 1, 1]
# game = Game.new(c); puts game.play; p game.choose_random_sequence

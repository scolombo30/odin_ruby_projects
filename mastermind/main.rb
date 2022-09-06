# frozen_string_literal: true

$LOAD_PATH << '.'

require 'utils'
require 'instructions'
require 'game'
require 'human_player'

include Utils
include Instructions

print_rules
print_tutorial

a = choose_player == '1' ? HumanPlayer.new : computer_guess
p a

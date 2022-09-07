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

choose_player == '1' ? HumanPlayer.new.play : computer_guess

# frozen_string_literal: true

$LOAD_PATH << './tic_tac_toe'
require 'setup'
require 'grid'

include Instructions

print_instructions
one = ask_username(1)
puts "#{one} your symbol will be O"
two = ask_username(2)
puts "#{two} your symbol will be X"
Grid.new(one, two).play

$LOAD_PATH << './tic_tac_toe' 
require 'instructions'
require 'board'

include Instructions

print_instructions

Board.new.play

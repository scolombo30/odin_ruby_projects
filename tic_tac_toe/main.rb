$LOAD_PATH << './tic_tac_toe' 
require 'instructions'
require 'board'

include Instructions

print_rules()

Board.new.play

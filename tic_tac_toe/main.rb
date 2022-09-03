$LOAD_PATH << './tic_tac_toe' 
require 'instructions'
require 'grid'

include Instructions

print_instructions
puts 'Player one type your name:'
one = gets.chomp
puts "#{one} your symbol will be O"
puts 'Player two type your name:'
two = gets.chomp
puts "#{two} your symbol will be X"
Grid.new(one, two).play

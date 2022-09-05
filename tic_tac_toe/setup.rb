# frozen_string_literal: true

module Instructions
  def print_instructions
    puts 'Tic-tac-toe, noughts and crosses, or Xs and Os is a paper-and-pencil game for two players' \
         'who take turns marking the spaces in a three-by-three grid with X or O.' \
         'The player who succeeds in placing three of their marks in a' \
         'horizontal, vertical, or diagonal row is the winner.' \
         'It is a solved game, with a forced draw assuming best play from both players.'
    puts 'Press any key to continue...'
    gets
    puts 'Tic-tac-toe is played on a three-by-three grid by two players,' \
         'who alternately place the marks X and O in one of the nine spaces in the grid.' \
         'The grid is represented as a 3 by 3 matrix. When it\'s your turn to place the mark' \
         'it will be prompted to insert the coordinates of the cell you want your mark to be placed in.' \
         'These cell will be identified by its row and column number, wich you\'ll have to insert' \
         'The coordinates will be as follow'
    puts '      |       |      '
    puts '[1,1] | [1,2] | [1,3]'
    puts '      |       |      '
    puts '----- · ----- · -----'
    puts '      |       |      '
    puts '[2,1] | [2,2] | [2,3]'
    puts '      |       |      '
    puts '----- · ----- · -----'
    puts '      |       |      '
    puts '[3,1] | [3,2] | [3,3]'
    puts '      |       |      '
    puts 'Press any key to continue...'
    gets
  end

  def ask_username(player)
    number_player = player == 1 ? 'one' : 'two'
    puts "Player #{number_player} type your name:"
    loop do
      name = gets.chomp.gsub(' ', '_')
      return name unless name.empty?

      puts 'Empty name invalid, please re-insert:'
    end
  end
end

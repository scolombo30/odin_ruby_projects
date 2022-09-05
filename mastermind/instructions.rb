# frozen_string_literal: true
$LOAD_PATH << './mastermind'

require 'utils'

module Instructions
  def print_rules
    puts 'Mastermind or Master Mind is a code-breaking game for two players(in this case a real player and a computer)'
    puts 'It resembles an earlier pencil and paper game called Bulls and Cows that may date back a century.'
    puts 'The game is played using:'\
         '• Decoding board with 12 rows with 4 large holes next to 4 small holes'\
         '• Code pegs of six different colors'\
         '• Key pegs'
    puts 'Press ENTER to continue ...'
    gets
    puts 'The two players decide in advance who will become the codemaker and who the codebreaker'
    puts 'The codemaker chooses a pattern of four code pegs(in this version duplicates are allowed)'
    puts 'The codebreaker tries to guess the pattern, in both order and color, within 12 turns.'
    puts 'Each guess is made by typing the numbers corresponding to the colors you want guess'
    puts 'Then, the codemaker provides feedback by telling how many colors were correct but in the wrong position'\
         'and also how many colors were correct in both color and position.'
    puts 'If there are duplicate colors in the guess, they cannot all be awarded a key'\
         'peg unless they correspond to the same number of duplicate colors in the hidden code.'
    puts 'Once feedback is provided, another guess is made; guesses and feedback continue to alternate until'\
         'either the codebreaker guesses correctly, or all 12 guesses are wrong.'
    puts 'Press ENTER to continue ...'
    gets
  end

  def print_examples
    puts 'Now it\'s time for some examples:'
    puts 'When you will be asked to guess, there will be printed the colors with their corresponding numbers like so'
    print_colors
    puts 'So you\'ll have to type the number corresponding to the colors you want, separated with a white spaces'
    puts 'If your guess, for example is [red, white, yellow, white] then you\'d have to write [4 0 3 4],'\
         'without the square brackets'
    puts 'Press ENTER to continue ...'
    gets
    puts 'It\'s your turn now. Try to enter [ '\
         "#{ColorizedString['  2  '].colorize(:color => :black, :background => :magenta).concat(' ')}, "\
         "#{ColorizedString['  5  '].colorize(:color => :black, :background => :blue).concat(' ')}, "\
         "#{ColorizedString['  3  '].colorize(:color => :black, :background => :yellow).concat(' ')}, "\
         "#{ColorizedString['  0  '].colorize(:color => :black, :background => :white).concat(' ')}"\
         '], remeber to separate numbers with spaces'
    loop do
      input = gets.chomp
      if input == '2 5 3 0'
        puts 'Congrats you understood !'
        break
      else
        puts 'You\'re not following the rules I gave you, please retry and follow the instructions'
      end
    end
    puts 'Now that you\'ve understood how to enter your guess, it\'s time to see how the feedback is given.'
    puts 'Once you\'ve inputted the sequence, the program will check how and print two colored rectangles'\
         'The first one (green) will tell you how many right colors in the right place there were'
    puts 'The second one (light blue) will tell you how many right colors in the wrong place there were'
    puts 'If the correct sequence is'\
         "#{ColorizedString['  2  '].colorize(:color => :black, :background => :magenta).concat(' ')}, "\
         "#{ColorizedString['  5  '].colorize(:color => :black, :background => :blue).concat(' ')}, "\
         "#{ColorizedString['  3  '].colorize(:color => :black, :background => :yellow).concat(' ')}, "\
         "#{ColorizedString['  0  '].colorize(:color => :black, :background => :white).concat(' ')}"\
         'and you typed [3 5 1 2], the program will display as follow'
    puts "#{ColorizedString['  1  '].colorize(color: :black, background: :green)}  right colors in the right spot"
    puts "#{ColorizedString['  2  '].colorize(:color => :black, :background => :blue).concat(' ')}"\
         'right colors in the wrong spot'
    puts 'ACHIEVEMENT UNLOCKED: Finish the tutorial. Good luck and enjoy.'
    puts ''
  end
end


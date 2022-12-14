# frozen_string_literal: true

$LOAD_PATH << '.' # if you run from terminal when it is in ./odin_ruby_projects/tic_tac_toe
# $LOAD_PATH << './tic_tac_toe'  # if you run from terminal when it is in ./odin_ruby_projects
require 'exceptions'
class Grid
  PLAYER_ONE_SYMBOL = 'O'
  PLAYER_TWO_SYMBOL = 'X'

  attr_accessor :board
  attr_reader :player_one, :player_two

  def initialize(one, two)
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
    @player_one = one
    @player_two = two
  end

  def play
    puts 'And now let the game begin'
    turn = 'O'
    loop do
      player = turn == 'O' ? player_one : player_two
      puts "It\'s your turn #{player}"
      puts 'Please insert row (1-3): '
      row = gets.chomp.to_i
      puts 'Please insert column (1-3): '
      column = gets.chomp.to_i
      begin
        make_move(turn, row - 1, column - 1)
      rescue CellIndexOutOfBoundException
        redo
      rescue CellAlreadyOccupiedException
        redo
      end
      print_board
      begin
        victory?(turn)
      rescue WinException
        break
      end
      begin
        tie?(turn)
      rescue TieException
        break
      end
      turn = turn == 'O' ? 'X' : 'O'
    end
  end

  private

  def row_or_column_out_of_bound?(row, column)
    raise CellIndexOutOfBoundException if row > 2 || column > 2 || row.negative? || column.negative?

    false
  end

  def cell_occupied?(row, column)
    raise CellAlreadyOccupiedException unless @board[row][column] == ' '

    true
  end

  def print_board
    @board.each_with_index do |arr, outside_index|
      puts '     |     |     '
      arr.each_with_index do |cell, index|
        print "  #{cell}  |" if index < 2
        print "  #{cell}\n" if index == 2
      end
      puts '     |     |     '
      puts '---- · --- · ----' if outside_index < 2
    end
  end

  def make_move(player, row, column)
    row_or_column_out_of_bound?(row, column)
    cell_occupied?(row, column)
    @board[row][column] = if player == 'O'
                            PLAYER_ONE_SYMBOL
                          else
                            PLAYER_TWO_SYMBOL
                          end
  end

  def victory?(player)
    player_name = player == 'O' ? player_one : player_two
    raise WinException, player_name if victory_rows?(player) || victory_columns?(player) || victory_diagonals?(player)

    false
  end

  def victory_rows?(player)
    return true if @board[0][0] == @board[0][1] && @board[0][0] == @board[0][2] && @board[0][0] == player
    return true if @board[1][0] == @board[1][1] && @board[1][0] == @board[1][2] && @board[1][0] == player
    return true if @board[2][0] == @board[2][1] && @board[2][0] == @board[2][2] && @board[2][0] == player
  end

  def victory_columns?(player)
    return true if @board[0][0] == @board[1][0] && @board[0][0] == @board[2][0] && @board[0][0] == player
    return true if @board[0][1] == @board[1][1] && @board[0][1] == @board[2][1] && @board[0][1] == player
    return true if @board[0][2] == @board[1][2] && @board[0][2] == @board[2][2] && @board[0][2] == player
  end

  def victory_diagonals?(player)
    return true if @board[0][0] == @board[1][1] && @board[0][0] == @board[2][2] && @board[0][0] == player
    return true if @board[0][2] == @board[1][1] && @board[0][2] == @board[2][0] && @board[0][2] == player
  end

  def tie?(player)
    full = @board.all? do |row|
      row.all? { |cell| cell != ' ' }
    end
    raise TieException if full && !victory?(player)

    false
  end
end

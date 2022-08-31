$LOAD_PATH << '.'
require 'exceptions.rb'
class Board
  PLAYER_ONE_SYMBOL = 'O'
  PLAYER_TWO_SYMBOL = 'X'

  def initialize
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def make_move(player, row, column)
    if row_or_column_out_of_bound?(row, column)
      false
    elsif cell_occupied?(row, column)
      @board[row][column] = if player == 'O'
                              PLAYER_ONE_SYMBOL
                            else
                              PLAYER_TWO_SYMBOL
                            end
      true
    else
      false
    end
  end

  def victory?(player)
    raise WinException, player if victory_rows?(player) || victory_columns?(player) || victory_diagonals?(player)

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

  def play
    puts 'Welcome to Tic-Tac-Toe. Let the game begin'
    turn = 'O'
    loop do
      player = turn == 'O' ? 'Player one' : 'Player two'
      puts "It\'s your turn #{player}"
      # player inputs rows and columns
      puts 'Please insert row (1-3): '
      row = gets.chomp.to_i
      puts 'Please insert column (1-3): '
      column = gets.chomp.to_i
      begin
        make_move(turn, row - 1, column - 1)
      rescue CellIndexOutOfBound => e
        puts "The cell you choose had and index not between 1 and 3. Please re-insert. "
        redo
      rescue CellAlreadyOccupied => e
        puts "The cell you choose is already been marked. Please choose another one."
        redo
      end
      print_board
      begin
        victory?(turn)
      rescue WinException => e
        puts "Congratulation #{e.winner}, you WON!"
        break
      end
      begin
        tie?(turn)
      rescue TieException
        puts "It's a tie"
        break
      end
      turn = turn == 'O' ? 'X' : 'O'
    end
  end

  private

  def row_or_column_out_of_bound?(row, column)
    if row > 2 || column > 2 || row < 0 || column < 0
      raise CellIndexOutOfBound
      true
    else
      false
    end
  end

  def cell_occupied?(row, column)
    if @board[row][column] == ' '
      true
    else
      raise CellAlreadyOccupied
      false
    end
  end

  def print_board
    @board.each do |arr|
      arr.each_with_index do |cell, index|
        print "#{cell}|" if index < 2
        print "#{cell}\n" if index == 2
      end
    end
  end
end

Board.new.play

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

  def make_move(turn1, row, column)
    if row_or_column_out_of_bound?(row, column)
      false
    elsif cell_occupied?(row, column)
      @board[row][column] = if turn1
                              PLAYER_ONE_SYMBOL
                            else
                              PLAYER_TWO_SYMBOL
                            end
      true
    else
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

  def game_over?
    victory? || tie?
  end

  def victory?(player)
    raise WinException, 'Player one' if victory_rows?(player) || victory_columns?(player) || victory_diagonals?(player)

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

  def tie?
    full = @board.all? do |row|
      row.all? { |cell| cell != ' ' }
    end
    return true if full && !victory?

    false
  end

  def play; end

  private

  def row_or_column_out_of_bound?(row, column)
    if row > 2 || column > 2
      puts 'Row or column out of bound'
      true
    else
      false
    end
  end

  def cell_occupied?(row, column)
    if @board[row][column] == ' '
      true
    else
      puts 'The cell is already marked'
      false
    end
  end
end

game = Board.new
game.make_move(true, 0, 0)
game.make_move(true, 1, 1)
game.make_move(false, 2, 2)
game.print_board

# frozen_string_literal: true

class WinException < StandardError
  attr_reader :winner

  def initialize(winner)
    @winner = winner == 'O' ? 'Player one' : 'Player two'
    super
  end
end

class TieException < StandardError; end

class CellIndexOutOfBoundException < StandardError; end

class CellAlreadyOccupiedException < StandardError; end

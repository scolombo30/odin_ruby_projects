class WinException < StandardError
  attr_reader :winner

  def initialize(winner)
    @winner = winner == 'O' ? 'Player one' : 'Player two'
    super
  end
end

class TieException < StandardError
  def initialize
    super
  end
end

class CellIndexOutOfBound < StandardError
  def initialize
    super
  end
end

class CellAlreadyOccupied < StandardError
  def initialize
    super
  end
end


# frozen_string_literal: true

class WinException < StandardError
  attr_reader :winner

  def initialize(winner)
    puts "Congratulation #{winner}, you WON!"
    super
  end
end

class TieException < StandardError
  def initialize
    puts "It's a tie"
    super
  end
end

class CellIndexOutOfBoundException < StandardError
  def initialize
    puts 'The cell you choose had and index not between 1 and 3. Please re-insert.'
    super
  end
end

class CellAlreadyOccupiedException < StandardError
  def initialize
    puts 'The cell you choose is already been marked. Please choose another one.'
    super
  end 
end

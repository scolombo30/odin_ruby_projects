class WinException < StandardError
  attr_reader :winner

  def initialize(winner)
    @winner = winner
  end
end

begin
  raise WinException, 'Player one'
rescue StandardError => e
  puts e.winner
end

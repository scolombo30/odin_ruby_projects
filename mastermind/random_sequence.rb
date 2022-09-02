module RandomSequence
  def choose_random_sequence
    sequence = []
    4.times do |i|
      case random = rand(0...5)
      when 0
        sequence[i] = :white
      when 1
        sequence[i] = :cyan
      when 2
        sequence[i] = :magenta
      when 3
        sequence[i] = :yellow
      when 4
        sequence[i] = :red
      when 5
        sequence[i] = :black
      end
    end
    sequence
  end
end

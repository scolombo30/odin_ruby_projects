# frozen_string_literal: true

module Utils
  def choose_random_sequence
    sequence = []
    4.times do |i|
      random = rand(0...5)
      sequence[i] = :white if random.zero?
      sequence[i] = :cyan if random == 1
      sequence[i] = :magenta if random == 2
      sequence[i] = :yellow if random == 3
      sequence[i] = :red if random == 4
      sequence[i] = :black if random == 5
    end; sequence
  end
end

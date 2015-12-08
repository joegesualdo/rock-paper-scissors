class Player
  attr_reader :score, :name

  def initialize(name, opts = {})
    @name = name.capitalize
    @score = 0
  end

  def scored(points = 1)
    @score += points
  end
end

class Player
  attr_reader :number
  attr_accessor :score

  def initialize(number)
    @number = number
    @score = 3
  end
end

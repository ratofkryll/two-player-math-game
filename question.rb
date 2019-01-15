class Question
  attr_reader :num1, :num2, :solution
  def initialize
    @num1 = (rand(1..20)).to_i
    @num2 = (rand(1..20)).to_i
    @solution = @num1 + @num2
  end
end

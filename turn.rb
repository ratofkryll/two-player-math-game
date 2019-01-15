require_relative 'question'

class Turn
  def initialize
    @question = Question.new
  end

  def print_question
    "What does #{@question.num1} plus #{@question.num2} equal?"
  end

  def get_guess
    guess = gets.chomp.to_i
  end

  def check_solution(guess)
    guess.to_i == @question.solution.to_i ? true : false
  end
end

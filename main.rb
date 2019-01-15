require_relative 'game'
require_relative 'player'
require_relative 'question'
require_relative 'turn'

player1 = Player.new(1)
player2 = Player.new(2)

p player1
p player2

puts player1.score

player1.score = player1.score - 1

puts player1.score

puts (rand(1..20)).to_i

question = Question.new
puts question.num1
puts question.num2
puts question.solution

turn = Turn.new

guess = turn.get_guess

puts turn.print_question
puts turn.check_solution(guess)

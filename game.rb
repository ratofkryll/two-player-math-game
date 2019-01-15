require_relative 'player'
require_relative 'turn'

class Game
  def initialize
    @current_player = 1
    @players = []
  end

  def add_players
    num = gets.chomp.to_i
    @players = num.times.collect {|i| Player.new(i + 1)}
  end

  def decrease_score
    player = @players.find {|player| player.id == @current_player}
    player.score = player.score - 1

    if player.score < 1
      @players.delete(player)
    end
  end

  def print_scores
    @players.each {|player| print "P#{player.id}: #{player.score}/3 "}
    puts "\n"
  end

  def next_player
    @current_player < @players.length ? @current_player = @current_player + 1 : @current_player = 1
  end

  def new_turn
    turn = Turn.new

    print "Player#{@current_player}: "
    puts turn.print_question

    print "> "
    guess = turn.get_guess

    print "Player#{@current_player}: "
    if turn.check_solution(guess) == true
      puts "YES! You are correct!"
    else
      puts "Seriously? No."
      decrease_score
    end

    print_scores

    next_player
  end

  def start_game
    puts "How many players?"
    print "> "
    add_players

    while @players.length > 1 do
      new_turn
      puts "----- NEW TURN -----"
    end

    if @players.length == 1
      player = @players[0]
      puts "Player #{player.id} wins with a score of #{player.score}/3!"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    end
  end

end

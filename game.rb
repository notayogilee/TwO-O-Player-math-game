require_relative './player'

class Game
  
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player2
  end

  def alternate_player
    @current_player == @player1 ?
    @current_player = @player2 : 
    @current_player = @player1  
  end

  def math_question(player)
    x = rand(1..20)
    y = rand(1..20)
    result = x + y
    puts "What does #{x} plus #{y} equal?"
    print "> "
    answer = gets.chomp

    if (answer.to_i == result)
      puts "Yes! You are correct!"
    else
      puts "Wrong!"
      player.wrong_answer
    end

  end

  def turn(player)
  
    print "#{player.name}: " 
    math_question(player)
    
  end

  def no_lives_left?

    @current_player.lives < 1

  end

  def round_stats

    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

  end

  def game_over(player)

    puts "#{player.name} wins with a score of #{player.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"

  end

  def play
    
    until(no_lives_left?) do
      
      alternate_player
      turn(@current_player)

      if @current_player.lives != 0
        round_stats
      puts "----- NEW TURN -----"
     end

    end

   game_over(alternate_player)

  end

end


  

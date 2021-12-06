require './player'
require './cell'
require './board'

class Game
  def initialize
    @players = [Player.new('X'), Player.new('O')]
    @board = Board.new(3)
    @winner = false
  end

  def run
    turn = 0
    loop do
      current_player = @players[turn % @players.length]
      @board.display

      next until (move = player_choice(current_player)) && @board.put_symbol(move, current_player.symbol)

      if @board.winning?(current_player.symbol)
        puts "#{current_player.symbol} wins!"
        break
      elsif @board.full?
        puts 'A tie!'
        break
      end
      turn += 1
    end
  end

  private

  def player_choice(player)
    puts "Now it's #{player.symbol}'s move"
    puts 'Enter Y coordinate'
    y = gets.to_i
    puts 'Enter X coordinate'
    x = gets.to_i
    if x.between?(0, @board.side - 1) && y.between?(0, @board.side - 1)
      y * @board.side + x
    else
      false
    end
  end
end

game = Game.new
game.run

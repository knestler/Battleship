require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/ship'

class Round

  def initialize(board_size)
    @player = Player.new(board_size)
    @computer = Computer.new(board_size)
  end

  def define_board_size
    puts "What size board would you like to play with?"
  
  end

  def start
    @computer.place_ships
    @player.place_ships
    take_turn
  end

  def take_turn
    loop do
      @computer.render
      @player.render
      @computer.player_shot
      if player_won?
        break
      end
      @player.computer_shot
      if computer_won?
        break
      end
    end
 end

 def computer_won?
   @player.ships.all?{|ship| ship.sunk?}
 end

 def player_won?
   @computer.ships.all?{|ship| ship.sunk?}
 end

end

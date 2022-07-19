require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/ship'

class Round

  def initialize
    @player = Player.new
    @computer = Computer.new
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

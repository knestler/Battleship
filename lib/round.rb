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
  end

  def take_turn
    puts "=============COMPUTER BOARD============="
    @computer.board.render
    puts "==============PLAYER BOARD=============="
    @player.board.render
   @computer.player_shot
   @player.computer_shot
 end

end

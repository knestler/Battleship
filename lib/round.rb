#require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/ship'

class Round

  def initialize
    @player = Player.new
    #@computer = Computer.new
  end

  def start
    @player.place_ships
  end
end

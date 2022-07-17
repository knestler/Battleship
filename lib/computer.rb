class Computer

  attr_reader :computer_board, :ships

  def initialize
    @computer_board = Board.new
    @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

  def random_cell
    @computer_board.cells
    random_sample = @computer_board.cells.keys.sample
  end

  def random_array(ship)
    placement_array = []
    until @computer_board.valid_placement?(ship, placement_array)
      placement_array = [random_cell]
      sample = ["H", "V"].sample
      i = 0

      if sample == "H"
        until placement_array.length == ship.length
          placement_array << placement_array[i][0].next + placement_array[i][1..-1]
          i += 1
        end
      else
        until placement_array.length == ship.length
          placement_array << placement_array[i][0] + placement_array[i][1..-1].next
          i += 1
        end
      end
      placement_array
    end
    placement_array
  end

  def place_ships
    @ships.each do |ship|
      @computer_board.place(ship, random_array(ship))
    end
  #  @computer_board.render(true)
  end
end

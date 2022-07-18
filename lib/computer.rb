class Computer

  attr_reader :board, :ships

  def initialize
    @board = Board.new
    @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

  def random_cell
    @board.cells.keys.sample
  end

  def horizontal_or_vertical
    ["H", "V"].sample
  end

  def random_array(ship)
    placement_array = []
    until @board.valid_placement?(ship, placement_array)
      placement_array = [random_cell]
      sample = horizontal_or_vertical
      i = 0
      if sample == "V"
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
      @board.place(ship, random_array(ship))
    end
  end
end

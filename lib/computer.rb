class Computer

  attr_accessor :ships
  attr_reader :board

  def initialize(board_size = 4, ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)])
    @board = Board.new(board_size)
    @ships = ships
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

  def player_cell_input
    gets.chomp.upcase
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    loop do
      shot_coords = player_cell_input
      until @board.cells.keys.include?(shot_coords)
        puts "Please enter a valid coordinate:"
        shot_coords = player_cell_input
      end
      if @board.cells[shot_coords].fired_upon?
        puts "You have already tried to shoot there."
      end
      if !@board.cells[shot_coords].fired_upon? && @board.cells.keys.include?(shot_coords)
        @board.cells[shot_coords].fire_upon
        if @board.cells[shot_coords].ship == nil
          puts "Your shot on #{shot_coords} was a miss"
        elsif @board.cells[shot_coords].ship != nil && !@board.cells[shot_coords].ship.sunk?
          puts "Your shot on #{shot_coords} was a hit!"
        else
          puts "My #{@board.cells[shot_coords].ship.name} was sunk!"
        end
        break
      end
      puts "Please enter a valid coordinate:"
    end
  end

  def render
    puts "=============COMPUTER BOARD============="
    @board.variable_board_render
  end

end

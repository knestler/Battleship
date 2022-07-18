require './lib/board'
require './lib/ship'

class Player
  attr_reader :board, :ships

  def initialize
    @board = Board.new
    @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

  def place_ships
    puts "I have laid my ships out on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    @board.render
    puts "Enter the squares for the Cruiser (3 spaces)"
    puts "Example: 'A1 A2 A3'"
    add_ship_to_board(0)
    puts "Enter the squares for the Submarine (2 spaces)"
    add_ship_to_board(1)

  end

  def add_ship_to_board(ship_element_num)
    coords = get_ship_coords(ship_element_num)
    @board.place(@ships[ship_element_num], coords)
    @board.render(true)
  end



  def get_ship_coords(ship_element_num)
    while coord = gets.chomp.split(" ").map{|coord| coord.upcase}
      if @board.valid_placement?(@ships[ship_element_num], coord)
        break
      else
        puts "Those are invalid coordinates. Please try again:"
        @board.render(true)
      end
    end
    coord
  end

  def random_cell
    @board.cells.keys.sample
  end

  def computer_shot
    loop do
      shot_coords = random_cell
      if !@board.cells[shot_coords].fired_upon?
        @board.cells[shot_coords].fire_upon
        if @board.cells[shot_coords].ship == nil
          puts "My shot on #{shot_coords} was a miss"
        elsif @board.cells[shot_coords].ship == !nil && @ship.sunk? == false
          puts "My shot on #{shot_coords} was a hit!"
        else
          puts "My #{@board.cells[shot_coords].ship} was sunk!"
        end
        break

      end
    end
  end

end

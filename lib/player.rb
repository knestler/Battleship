require './lib/board'
require './lib/ship'

class Player
  attr_reader :board, :ships

  def initialize(board_size = 4, ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)])
    @board = Board.new(board_size)
    @ships = ships
  end

  def place_ships
    puts "I have laid my ships out on the grid."
    puts "You now need to lay out your ships."
    display_info = @ships.map do |ship|
      [ship.name, ship.length]
    end
    i = 0
    @ships.length.times do
      render
      puts "The #{display_info[i][0]} is #{display_info[i][1]} units long."
      
      puts "Enter the squares for the #{display_info[i][0]}:"    
      add_ship_to_board(i)
      i += 1
    end

  end

  def add_ship_to_board(ship_element_num)
    coords = get_ship_coords(ship_element_num)
    @board.place(@ships[ship_element_num], coords)
    render
  end



  def get_ship_coords(ship_element_num)
    while coord = gets.chomp.split(" ").map{|coord| coord.upcase}
      if @board.valid_placement?(@ships[ship_element_num], coord)
        break
      else
        puts "Those are invalid coordinates. Please try again:"
        render
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
        elsif @board.cells[shot_coords].ship != nil && !@board.cells[shot_coords].ship.sunk?
          puts "My shot on #{shot_coords} was a hit!"
        else
          puts "Your #{@board.cells[shot_coords].ship.name} was sunk!"
        end
        break

      end
    end
  end

  def render
    puts "==============PLAYER BOARD=============="
    @board.variable_board_render(true)
  end

end

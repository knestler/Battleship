class Computer

    attr_reader :computer_board, :ships

    def initialize 
        @computer_board = Board.new
        @ships = [@cruiser = Ship.new("Cruiser", 3), @submarine = Ship.new("Submarine", 2)]
    end
    
    
    def random_cell
        @computer_board.cells
        random_sample = @computer_board.cells.keys.sample
    end


    def random_array(ship)
        #random_sample
        placement_array = Array.new
        until placement_array.length == ship.length
            placement_array << random_cell
        end
        placement_array
        end
    end

    def valid_coords(ship)
        
        coordinates = random_array(ship)
        valid_coordinatess = []
        
        if @computer_board.valid_placement?(ship, coordinates) == true
           valid_computer_coords(ship)
        else 
            return valid_coordinates = coordinates
        end
    end


    def place_ship(ship)
        @ships.each do |ship|
            @computer_board.place(ship, coordinates)
        end
    end

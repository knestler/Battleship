
require './lib/ship'

class Getter
    
    attr_reader :board_size, :player_ships, :computer_ships

    def initialize
        @board_size = get_board_size
        @ship_number = ship_num
        @ship_names_and_lengths = ship_name_and_length
        @player_ships = ship_generator
        @computer_ships = ship_generator

    end
    
    def get_board_size
        puts "What size board would you like to play with?"
        round = gets.chomp.to_i
    end

    def ship_num
        puts "How many ships would you like to play with?"
        ship_number = gets.chomp.to_i
    end

    def ship_generator
        ships = @ship_names_and_lengths.map do |name, length|
            Ship.new(name, length)
        end
        ships
    end

    # def computer_ship_generator

    def ship_name_and_length
        names = []
        @ship_number.times do 
            ship = []
            puts "What would you like the name of this Ship to be?"
            ship << gets.chomp
            puts "How long would you like this ship to be?"
            ship << gets.chomp.to_i
            names << ship
        end
        names
    end

end

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
    board_size = gets.chomp.to_i
    until board_size < 26 && board_size > 2
      puts "Invalid board size."
      board_size = gets.chomp.to_i
    end
    board_size
  end

  def ship_num
    puts "How many ships would you like to play with?"
    ship_n = gets.chomp.to_i
    until ship_n <= @board_size - 2
      puts "That's too many ships for a board this size."
      puts "Try fewer ships"
      ship_n = gets.chomp.to_i
    end
    ship_n
  end

  def ship_generator
    ships = @ship_names_and_lengths.map do |name, length|
      Ship.new(name, length)
    end
    ships
  end

  def ship_name_and_length
    names = []
    i = 1
    @ship_number.times do
      ship = []
      puts "What would you like the name of Ship ##{i.to_s} to be?"
      i += 1
      ship << gets.chomp
      puts "How long would you like this ship to be?"
      ship << gets.chomp.to_i
      until ship[1] <= @board_size
        puts "Your ship is too long for the board!"
        ship[1] = gets.chomp.to_i
      end
      names << ship
    end
    names
  end
end

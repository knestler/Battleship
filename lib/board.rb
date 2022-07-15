require './lib/cell'

class Board
  attr_reader :cells

  # default board size = 4
  def initialize(board_size = 4)
    # @board_size = board_size
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
     }
  end

  def valid_coordinate?(cell)
    @cells.include?(cell)
  end

  def valid_placement?(ship, placement_array)
    placement_valid_length?(ship, placement_array) &&
    placement_coords_consecutive?(placement_array) &&
    unstacked_ship?(placement_array)
  end

  def place(ship, placement_array)
    placement_array.each do |coord|
      @cells[coord].place_ship(ship)
    end
  end

  def render(display_ship = false)
    "  1 2 3 4 \n" +
    "A " + @cells["A1"].render(display_ship) + " " + @cells["A2"].render(display_ship) + " " + @cells["A3"].render(display_ship) + " " + @cells["A4"].render(display_ship) + " \n" +
    "B " + @cells["B1"].render(display_ship) + " " + @cells["B2"].render(display_ship) + " " + @cells["B3"].render(display_ship) + " " + @cells["B4"].render(display_ship) + " \n" +
    "C " + @cells["C1"].render(display_ship) + " " + @cells["C2"].render(display_ship) + " " + @cells["C3"].render(display_ship) + " " + @cells["C4"].render(display_ship) + " \n" +
    "D " + @cells["D1"].render(display_ship) + " " + @cells["D2"].render(display_ship) + " " + @cells["D3"].render(display_ship) + " " + @cells["D4"].render(display_ship) + " \n"
  end

  private

  def placement_valid_length?(ship, placement_array)
    ship.length == placement_array.length
  end

  def array_consecutive?(array)
    array.each_cons(2).all? {|a,b| b == a + 1 }
  end

  def array_elements_same?(array)
    array.all?{|element| element == array[0]}
  end

  def placement_coords_consecutive?(placement_array)
    letters = placement_array.map{|coord| coord[0].ord}
    numbers = placement_array.map{|coord| coord[1..-1].to_i}

    (array_consecutive?(letters) && array_elements_same?(numbers)) ||
    (array_consecutive?(numbers) && array_elements_same?(letters))

  end

  def unstacked_ship?(placement_array)
    cell_empty = []
    placement_array.each do |coord|
      cell_empty << @cells[coord].empty?
    end
    cell_empty.all?(true)
  end

end








  ## Not yet working... come back to it for Iteration 4
  # def create_cells
  #   letters = "A".."Z"
  #   column_labels = letters.to_a.first(@board_size)
  #   cell_coords = column_labels.map do |label|
  #                   label + (label.ord - 64).to_s
  #                 end
  #   cells_hash = Hash.new{}
  #   cell_coords.each do |coordinate|
  #     cells_hash[coordinate] = Cell.new(coordinate)
  #   end
  #   cells_hash
  # end

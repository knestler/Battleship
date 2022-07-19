require './lib/cell'

class Board
  attr_reader :cells

  # default board size = 4
  def initialize(board_size = 4)
    @board_size = board_size
    @cells = create_cells
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
    rendered = "  1 2 3 4 \n" +
    "A " + @cells["A1"].render(display_ship) + " " + @cells["A2"].render(display_ship) + " " + @cells["A3"].render(display_ship) + " " + @cells["A4"].render(display_ship) + " \n" +
    "B " + @cells["B1"].render(display_ship) + " " + @cells["B2"].render(display_ship) + " " + @cells["B3"].render(display_ship) + " " + @cells["B4"].render(display_ship) + " \n" +
    "C " + @cells["C1"].render(display_ship) + " " + @cells["C2"].render(display_ship) + " " + @cells["C3"].render(display_ship) + " " + @cells["C4"].render(display_ship) + " \n" +
    "D " + @cells["D1"].render(display_ship) + " " + @cells["D2"].render(display_ship) + " " + @cells["D3"].render(display_ship) + " " + @cells["D4"].render(display_ship) + " \n"
    print rendered
    rendered
  end

  def create_cells
    letters = "A".."Z"
    row_labels = (letters.to_a.first(@board_size) * @board_size).sort
    column_labels = []
    @board_size.times do
      column_labels << (1..@board_size).to_a
    end
    column_labels = column_labels.flatten.map{ |x| x.to_s}
    cell_coords = row_labels.zip(column_labels).map { |x| x.join}

    cells_hash = Hash.new{}
    cell_coords.each do |coordinate|
      cells_hash[coordinate] = Cell.new(coordinate)
    end
    cells_hash
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
      if @cells[coord] != nil
        cell_empty << @cells[coord].empty?
      else
        return false
      end
    end
    cell_empty.all?(true)
  end

end








  # Not yet working... come back to it for Iteration 4
  # def create_cells
  #   letters = "A".."Z"
  #   column_labels = letters.to_a.first(@board_size)
  #   cell_coords = column_labels.map do |label|
  #                   label + (label.ord - 64).to_s
  #                 end
  #                 pry
  #   cells_hash = Hash.new{}
  #   cell_coords.each do |coordinate|
  #     cells_hash[coordinate] = Cell.new(coordinate)
  #   end
  #   cells_hash
  # end

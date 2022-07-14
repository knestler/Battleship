require './lib/cell'

class Board
  attr_reader :cells

  # default board size = 4
  def initialize(board_size = 4)
    # @board_size = board_size
    # @cells =
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

end

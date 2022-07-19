require './lib/board'
require './lib/ship'

RSpec.describe Board do

  before :each do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@board).to be_instance_of(Board)
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.keys.length).to eq(16)
    expect(@board.cells.values).to all(be_instance_of(Cell))
  end

  it 'can tell if coordinates are on the board' do
    expect(@board.valid_coordinate?("A1")).to be(true)
    expect(@board.valid_coordinate?("D4")).to be(true)
    expect(@board.valid_coordinate?("A5")).to be(false)
    expect(@board.valid_coordinate?("E1")).to be(false)
    expect(@board.valid_coordinate?("A22")).to be(false)
  end

  it 'validates the number of coordinates matches ship length' do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be(true)
  end

  it 'validates ship placement coordinates are consecutive' do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be(false)
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be(false)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to be(true)
    expect(@board.valid_placement?(@submarine, ["B1", "C1"])).to be(true)
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "A3"])).to be(false)
  end

  it 'validates ship placement coordinates are not diagonal' do
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to be(false)
  end

  it 'places ships in cells' do
    @board.place(@cruiser, ["A1", "A2", "A3"])

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    expect(cell_1.ship).to be(@cruiser)
    expect(cell_2.ship).to be(@cruiser)
    expect(cell_3.ship).to be(@cruiser)
   end

  it 'validates that ships cannot be placed on each other' do
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to be(false)
  end

  it 'renders the board' do
     @board.place(@cruiser, ["A1", "A2", "A3"])
     expect(@board.render).to match("  1 2 3 4 \n" +
                                    "A . . . . \n" +
                                    "B . . . . \n" +
                                    "C . . . . \n" +
                                    "D . . . . \n")
     expect(@board.render(true)).to match("  1 2 3 4 \n" +
                                          "A S S S . \n" +
                                          "B . . . . \n" +
                                          "C . . . . \n" +
                                          "D . . . . \n")
  end

  it 'can choose a board size' do
    @board.create_cells
  end

end

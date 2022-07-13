require './lib/board'
require './lib/ship'

RSpec.describe Board do

  before :each do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do
    expect(@board).to be_instance_of(Board)
    expect(@board).to be_a(Hash)
    expect(@board.keys.length).to eq(16)
    expect(@board.values).to all(be_instance_of(Card)
  end

  xit 'can tell if coordinates are valid' do
    expect(board.valid_coordinate?("A1")).to be_true
    expect(board.valid_coordinate?("D4")).to be_true
    expect(board.valid_coordinate?("A5")).to be_false
    expect(board.valid_coordinate?("E1")).to be_false
    expect(board.valid_coordinate?("A22")).to be_false
  end

  xit "validates ship placements"
    

  xit 'chooses possible cells ' do
       board.place(cruiser, ["A1", "A2", "A3"])
       expect(cell_1 = @board.cells["A1"]).to be_instance_of(cell_1)
    # => #<Cell:0x00007fcb0e1f66a8...>
       expect(cell_2 = @board.cells["A2"]).to be_instance_of(cell_2)
    # => #<Cell:0x00007fcb0e1f6630...>
       expect(cell_3 = @board.cells["A3"]).to be_instance_of(cell_3)
    # => #<Cell:0x00007fcb0e1f65b8...>
   end
   xit 'places ship in cell' do
       expect(cell_1.ship).to be_instance_of(Ship)
    # => #<Ship:0x00007fcb0e1ffa28...>
       expect(cell_2.ship).to be_instance_of(Ship)
    # => #<Ship:0x00007fcb0e1ffa28...>
       expect(cell_3.ship).to be_instance_of(Ship)
    # => #<Ship:0x00007fcb0e1ffa28...>
       expect(cell_3.ship == cell_2.ship).to be(true)
   end
   ### Overlapping ships
   xit 'places submarine on board' do
       expect(@board.place(cruiser, ["A1", "A2", "A3"])
       expect(submarine = Ship.new("Submarine", 2).to be_instance_of(Ship)
    # => #<Ship:0x00007fcb0dace9c0...>
       expect(board.valid_placement?(submarine, ["A1", "B1"])).to be(false)
   end
   xit 'places ship on board' do
       @board.place(@cruiser, ["A1", "A2", "A3"])
       expect(@board.render).to match("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
       expect(@board.render(true)).to match("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
   end

end

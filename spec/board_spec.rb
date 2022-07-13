require './lib/board'
require './lib/ship'

RSpec.describe Board do

  before :each do
    @board = Board.new
  end

  it 'exists' do
    expect(@board).to be_instance_of(Board)
    expect(@board).to be_a(Hash)
    expect(@board.keys.length).to eq(16)
    expect(@board.values).to all(be_instance_of(Card)
  end

  xit '' do
  end


end

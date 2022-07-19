require './lib/player.rb'

RSpec.describe Player do

  before :each do
    @player = Player.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

  end

  it "exists" do
    expect(@player).to be_instance_of(Player)
  end

  it "has a board" do
    expect(@player.board).to be_instance_of(Board)
  end

  it "Has ships" do
    expect(@player.ships).to all(be_instance_of(Ship))
  end

  it 'Allows the computer to take a random shot' do
    allow(@player).to receive(:random_cell).and_return("B1")
    @player.computer_shot
    expect(@player.board.cells["B1"].fired_upon?).to be(true)
  end
end

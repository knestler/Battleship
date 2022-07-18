require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/computer'

RSpec.describe Computer do

    before :each do
        @computer = Computer.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
    end

    it 'board and ships exist' do
        expect(@computer.board).to be_a Board
        expect(@computer.ships).to be_a Array
    end

    it 'randomizes cell and chooses one' do
        expect(@computer.random_cell).to be_a String
    end

    it 'creates random array' do
        expect(@computer.random_array(@cruiser)).to be_a Array
    end

    it 'randomly places the ship (horizontal)' do
      allow(@computer).to receive(:random_cell).and_return("C1")
      allow(@computer).to receive(:horizontal_or_vertical).and_return("H")
      expect(@computer.random_array(@cruiser)).to eq(["C1", "C2", "C3"])
    end

    it 'randomly places the ship (vertical)' do
      allow(@computer).to receive(:random_cell).and_return("B1")
      allow(@computer).to receive(:horizontal_or_vertical).and_return("V")
      expect(@computer.random_array(@cruiser)).to eq(["B1", "C1", "D1"])
    end

    it 'validates random array' do
      expect(@computer.random_array(@cruiser).length).to eq 3
    end




end

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
        expect(@computer.computer_board).to be_a Board
        expect(@computer.ships).to be_a Array
    end

    it 'randomizes cell and chooses one' do
        expect(@computer.random_cell).to be_a String
    end

    it 'creates random array' do
        expect(@computer.random_array(@cruiser)).to be_a Array
    end

    it 'validates random array' do
        expect(@computer.valid_coords(@cruiser)).to be_a Array
        expect(@computer.valid_coords(@cruiser).length).to eq 3
        @computer.valid_coords(@cruiser)
    end
    
    xit 'once given a ship it can find random valid coordinates' do      
        @computer.place_ship == true
    end

end


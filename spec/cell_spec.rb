require './lib/cell'
require './lib/ship'

RSpec.describe Cell do

    before :each do
        @cell = Cell.new("B4")
    end

    it 'exists' do 
        expect(@cell.coordinate).to eq("B4")
    end 

    it 'has no ship' do 
        expect(@cell.ship).to be(nil)
        expect(@cell.empty?).to be(true)
    end 
    
    it 'will can contain ship' do
        cruiser = Ship.new("Cruiser", 3)
        @cell.place_ship(cruiser)
        expect(@cell.ship).to be_instance_of(Ship)
        expect(@cell.empty?).to be(false)
    end


end
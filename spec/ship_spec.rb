require "./lib/ship"

RSpec.describe Ship do

    before :each do
        @cruiser = Ship.new("Cruiser", 3)
    end

    it 'exists' do
        expect(@cruiser).to be_instance_of(Ship)
    end

    it 'has attributes' do
        expect(@cruiser.name).to eq('Cruiser')
        expect(@cruiser.length).to eq(3)
        expect(@cruiser.health).to eq(3)
    end

    it 'can be hit' do
        expect(@cruiser.health).to eq(3)
        @cruiser.hit
        expect(@cruiser.health).to eq(2)
    end

    it "can be sunk" do
        expect(@cruiser.sunk?).to be(false)
        @cruiser.hit
        @cruiser.hit
        @cruiser.hit
        expect(@cruiser.health).to eq(0)
        expect(@cruiser.sunk?).to be(true)
    end

end

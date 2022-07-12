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

    it 'can contain ship' do
        cruiser = Ship.new("Cruiser", 3)
        @cell.place_ship(cruiser)
        expect(@cell.ship).to be_instance_of(Ship)
        expect(@cell.empty?).to be(false)
    end

    it 'can be fired upon' do
      cruiser = Ship.new("Cruiser", 3)
      @cell.place_ship(cruiser)
      expect(@cell.fired_upon?).to be(false)
      @cell.fire_upon
      expect(@cell.ship.health).to eq(2)
      expect(@cell.fired_upon?).to be(true)
    end

    it 'will render a cell' do
      cell_1 = Cell.new("B4")
      expect(cell_1.render).to eq(".")
    end

    it 'can render a miss' do
      cell_1 = Cell.new("B4")
      cell_1.fire_upon
      expect(cell_1.render).to eq("M")
    end

    it 'will show a ship' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
    end

    it 'will show a hit' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
    end

    it 'it will render a cell with sunken Ship' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      expect(cruiser.sunk?).to be(false)

      cruiser.hit
      cruiser.hit
      cruiser.hit
      expect(cell_2.render).to eq("X")
    end

  end

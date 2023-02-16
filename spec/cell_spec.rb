require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
let(:cell) {cell = Cell.new("B4")}

  it 'exists' do
    expect(cell).to be_a Cell
  end
  
  describe '#cell attributes' do 
    xit 'cell has a coordinate' do
      expect(cell.coordinate).to eq("B4")
    end

    xit 'cell has no ship by default' do
      expect(cell.ship).to be nil
    end

    xit 'cell is empty by defualt' do
      expect(cell.empty?).to be true 
    end
  end

  describe '#ship placement' do
    let(:cruiser) {cruiser = Ship.new("Cruiser", 3)}

    xit 'the cell can have a ship placed in it' do
      cell.place_ship(cruiser)

      expect(cell.place_ship).to eq(expected)
    end

    xit 'the cell shows a ship instance' do
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
    end

    xit 'the cell shows as no longer empty' do
      cell.place_ship(cruiser)

      expect(cell.empty?).to be false 
    end
  end









end
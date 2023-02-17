require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
let(:cell) {cell = Cell.new("B4")}

  it 'exists' do
    expect(cell).to be_a Cell
  end

  describe '#cell attributes' do 
    it 'cell has a coordinate' do
      expect(cell.coordinate).to eq("B4")
    end

    it 'cell has no ship by default' do
      expect(cell.ship).to be nil
    end

    it 'cell is empty by defualt' do
      expect(cell.empty?).to be true 
    end
  end

  describe '#ship placement' do
    let(:cruiser) {cruiser = Ship.new("Cruiser", 3)}

    it 'the cell can have a ship placed in it' do
      expect(cell.place_ship(cruiser)).to eq(cruiser)
    end

    it 'the cell shows a ship instance' do
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
    end

    it 'the cell shows as no longer empty' do
      cell.place_ship(cruiser)

      expect(cell.empty?).to be false 
    end
  end

  describe '#Cell knows when it is fired upon' do
    let(:cruiser) {cruiser = Ship.new("Cruiser", 3)}

    it 'starts as not fired upon' do
      cell.place_ship(cruiser)

      expect(cell.fired_upon?).to be false
    end

    it 'can be fired upon' do
      cell.place_ship(cruiser)
      cell.fire_upon
      
      expect(cell.ship.health).to eq(2)
    end

    it 'cell will show as fired upon' do
      cell.fire_upon

      expect(cell.fired_upon?).to be true
    end
  end

  describe 'Cell can render' do
    let(:cruiser) {cruiser = Ship.new("Cruiser", 3)}
    let(:cell_1) {cell_1 = Cell.new("B4")}
    let(:cell_2) {cell_2 = Cell.new("C3")}

    it 'can render has default' do
      expect(cell_1.render).to eq(".")
    end

    it 'renders differently if it is a miss' do
      cell_1.fire_upon

      expect(cell_1.render).to eq("M")
    end

    it 'can place and render' do
      cell_2.place_ship(cruiser)

      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
    end

    it 'ship can be hit, render correctly and does not sink' do
      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
      expect(cruiser.sunk?).to be false
    end

    it 'can be sunk and render correctly' do
      cell_2.place_ship(cruiser)
      3.times do
        cell_2.fire_upon
      end

      expect(cruiser.sunk?).to be true
      expect(cell_2.render).to eq("X")
    end

    it 'can determine if a ship is present' do
      cell_2.place_ship(cruiser)
      expect(cell_2.ship_present?).to be true
    end
    

    

  end









end
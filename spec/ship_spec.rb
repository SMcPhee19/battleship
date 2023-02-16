require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  let(:cruiser) {cruiser = Ship.new("Cruiser", 3)}
  
  it 'exists' do
    expect(cruiser).to be_a Ship
  end

  it 'the ship has a name' do
    expect(cruiser.name).to eq("Cruiser")
  end

  it 'the ship has a length' do
    expect(cruiser.length).to eq(3)
  end

  it 'the ship has health' do
    expect(cruiser.health).to eq(3)
  end

  it 'the ship is not sunk by default' do
    expect(cruiser.sunk?).to be false
  end

  it 'the ship can can lose health' do
    cruiser.hit

    expect(cruiser.health).to eq(2)
  end

  it 'the can be sunk' do
    3.times do
      cruiser.hit
    end

    expect(cruiser.sunk?).to be true
  end
end
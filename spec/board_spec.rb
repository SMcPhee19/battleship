require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  let(:board) {board = Board.new}
  let(:cruiser) {cruiser = Ship.new("Cruiser", 3)}
  let(:submarine) {submarine = Ship.new("Submarine", 2)}

  describe '#the board' do
    it 'the board exists' do
      expect(board).to be_a Board
    end

    it 'the board has a hash of cell objects' do
      expect(board.cells).is_a?(Hash)
    end
  end

  describe '#valid cooridnates' do
    it 'the board can identify and validate a cooordinate' do
      expect(board.valid_coordinate?("A1")).to be true
      expect(board.valid_coordinate?("E1")).to be false
    end
  end

  describe '#valid placements' do
    it 'it can check if the ships placement is valid' do
      board.cells
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
      
    end

    it 'it can check if the coordiante are consecutive in the correct direction' do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false
    end

    it 'it can check for and reject diagonal coordiates' do
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to be false
    end

    it 'can confirm placement is correct after passing previous checks' do
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true 
    end
  end
end
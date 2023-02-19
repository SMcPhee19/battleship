require 'spec_helper'

RSpec.describe do
  let(:game) {Game.new}

  describe 'game startup' do
    it 'exists' do
      expect(game).to be_a Game
    end

    it 'game will create a computer board with ships' do
      game.game_setup

      expect(game.computer_board).to be_a Board
      expect(game.computer_sub).to be_a Ship
      expect(game.computer_cruiser).to be_a Ship
    end

    it 'will also create a board and ships for the player' do 
      game.game_setup

      expect(game.player_board).to be_a Board
      expect(game.player_sub).to be_a Ship
      expect(game.player_cruiser).to be_a Ship
    end

    it 'the game will place the computer ships' do
      game.game_setup
      game.computer_ship_placement

      expect(game.computer_board.render == game.computer_board.render(true)).to eq(false)
    end
    # require 'pry'; binding.pry
  end
end
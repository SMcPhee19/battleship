require 'spec_helper'

RSpec.describe do
  let(:game) {Game.new}

  describe 'game startup' do
    it 'exists' do
      expect(game).to be_a Game
    end

    
  end
end
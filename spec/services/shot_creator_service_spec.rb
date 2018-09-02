require 'rails_helper'

describe ShotCreatorService do
  before(:each) do
    player_1 = create(:user)
    player_2 =create(:user)
    @game = create(:game, player_1: player_1, player_2: player_2)
  end
  context 'instance methods' do
    it '#find_game' do
      scs = ShotCreatorService.new(@game.id)

      expect(scs.find_game).to eq(@game)
    end
  end
end
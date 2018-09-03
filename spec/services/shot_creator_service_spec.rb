require 'rails_helper'

describe ShotCreatorService do
  before(:each) do
    player_1 = create(:user)
    player_2 =create(:user)
    @game = create(:game, player_1: player_1, player_2: player_2)
    @target = "A1"
    @current_user = player_1
  end
  context 'instance methods' do
    it '#find_game' do
      scs = ShotCreatorService.new(@game.id, @target)

      expect(scs.find_game).to eq(@game)
    end

    it '#create_turn_process' do
      scs = ShotCreatorService.new(@game.id, @target)

      expect(scs.create_turn_process).to be_a(TurnProcessor)
    end

    
  end
end
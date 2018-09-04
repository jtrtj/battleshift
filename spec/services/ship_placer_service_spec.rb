require 'rails_helper'


describe ShipPlacerService do
  before(:each) do
    @player_1 = create(:user)
    @player_2 = create(:user)
    @game     = create(:game, player_1: @player_1, player_2: @player_2)
  end

  context 'attributes' do
    it 'instantiates with user params' do
      params = {
                  game_id: 1,
                  ship_size: 3,
                  start_space: "A1",
                  end_space: "A3"
                }

      user_api_key = 'akldfj'
      sps = ShipPlacerService.new(params, user_api_key)

      expect(sps).to be_a(ShipPlacerService)
    end
  end

  context 'instance methods' do
    it '#run' do

    end
  end
end

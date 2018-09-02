require 'rails_helper'


describe ShipPlacerService do
  context 'attributes' do
    it 'instantiates with user params' do
      params = {
                  game_id: 1,
                  ship_size: 3,
                  start_space: "A1",
                  end_space: "A3",
                }

      user_api_key = 'akldfj'
      sps = ShipPlacerService.new(params, user_api_key)

      expect(sps).to be_a(ShipPlacerService)
    end
  end
end

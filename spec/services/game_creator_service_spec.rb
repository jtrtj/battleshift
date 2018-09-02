require 'rails_helper'

describe GameCreatorService do
  context 'attributes' do
    it 'instantiates with user api key and opponent email' do
      user_api_key = 'fgdsa'
      opponent_email = 'dfgsa'

      gcs = GameCreatorService.new(user_api_key, opponent_email)

      expect(gcs.user_api_key).to eq(user_api_key)
      expect(gcs.opponent_email).to eq(opponent_email)
    end
  end
  
  context 'instance methods'  do
    it '#run creates a game' do
      user = create(:user)
      opponent = create(:user)
      user_api_key = user.user_token
      opponent_email = opponent.email

      gcs = GameCreatorService.new(user_api_key, opponent_email)
      gcs.run

      expect { gcs.run }.to change { Game.count }.by(1)
    end
  end
end
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
end
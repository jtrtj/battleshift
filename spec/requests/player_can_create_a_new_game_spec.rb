require 'rails_helper'

describe 'Activated User Starts a new game' do
  context 'by posting to /api/v1/games with the email of another registered user' do
    it 'will create a new game between user and opponent' do
      user = User.create(email: 'abc', name: 'def', password: 'ghi', user_token: 'token1', status: 1 )
      opponent = User.create(email: 'jkl', name: 'mno', password: 'pqr', user_token: 'token2', status: 1 )
      opponent_email = opponent.email

      new_game_options = { opponent_email: opponent_email }
      header = { "HTTP_X_API_KEY": user.user_token }

      post "/api/v1/games", headers: header, params: new_game_options

      game_response = JSON.parse(response.body, symbolize_names: true)

      expect(Game.count).to eq(1)
      expect(game_response[:message]).to eq("New Game Created.")
    end
  end

  context 'by posting to /api/v1/games with the email of an unregistered user' do
    it 'will tell the user that their opponent cannot be found' do
      user = User.create(email: 'abc', name: 'def', password: 'ghi', user_token: 'token1', status: 1 )
      opponent = User.create(email: 'jkl', name: 'mno', password: 'pqr', user_token: 'token2', status: 1 )
      opponent_email = "not in the db"

      new_game_options = { opponent_email: opponent_email }
      header = { "HTTP_X_API_KEY": user.user_token }

      post "/api/v1/games", headers: header, params: new_game_options

      game_response = JSON.parse(response.body, symbolize_names: true)

      expect(Game.count).to eq(0)
      expect(game_response[:message]).to eq("Game was not created. Check your credentials.")
    end
  end
end



=begin
  options = { opponent_email: ENV["BATTLESHIFT_OPPONENT_EMAIL"]
    endpoint = "/api/v1/games"
    payload = options.to_json
response = post_json(endpoint, payload)
=end

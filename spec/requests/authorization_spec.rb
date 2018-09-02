require 'rails_helper'

describe 'authorization' do
  it 'unregistered user cannot access api' do
    player_1 = create(:user)
    player_2 = create(:user)
    not_a_player = create(:user)
    game = create(:game, player_1: player_1, player_2: player_2)
    header = { "HTTP_X_API_KEY": not_a_player.user_token }

    post "/api/v1/games/#{game.id}/shots", headers: header

    expect(response.status).to eq(401)

    post "/api/v1/games/#{game.id}/ships", headers: header

    expect(response.status).to eq(401)
  end
end

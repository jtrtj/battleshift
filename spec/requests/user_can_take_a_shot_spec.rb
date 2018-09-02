require 'rails_helper'

describe 'a registered user' do
  before (:each) do
    @shot_fixture = File.read('./spec/fixtures/valid_shot.json')
    stub_request(:post, "https://safe-depths-59519.herokuapp.com/api/v1/games/1/shots")
                .with(headers: { 'Accept'=>'*/*',
                  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'X_API_KEY'=>"token #{ENV['BATTLESHIFT_API_KEY']}",
                  'User-Agent'=>'Faraday v0.12.2' } )
                .to_return(status: 200, body: @shot_fixture, headers: {})
  end

  context 'can post to /ap1/v1/games/:id/shots' do
    it 'see the result of the shot if valid' do
      expected = JSON.parse(@shot_fixture, symbolize_names: true)[:message]
      actual = "Your shot resulted in a Miss."
      
      expect(expected).to eq(actual)
    end
  end
end
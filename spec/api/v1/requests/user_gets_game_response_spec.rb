require 'rails_helper_development'

describe 'user hits an api endpoint for game' do
  it 'returns a JSON response with data for that game' do

    get '/api/v1/games/1'

    expect(response).to be_successful

    game_data = JSON.parse(response.body)
    expect(game_data["game_id"]).to eq(1)
    expect(game_data["scores"][0]["user_id"]).to eq(1)
    expect(game_data["scores"][0]["score"]).to eq(15)
    expect(game_data["scores"][1]["user_id"]).to eq(2)
    expect(game_data["scores"][1]["score"]).to eq(16)
  end
end

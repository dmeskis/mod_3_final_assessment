require 'rails_helper'

describe 'user hits an api endpoint for game' do
  it 'returns a JSON response with data for that game' do

    get '/api/v1/games/1'

    expect(response).to be_successful

    game_data = JSON.parse(response.body)

    expect(game_data["game_id"].to eq(1)
    expect(game_data["scores"][0]["user_id"].to eq(1)
    expect(game_data["scores"][0]["score"].to eq(15)
    expect(game_data["scores"][0]["user_id"].to eq(2)
    expect(game_data["scores"][0]["score"].to eq(16)
  end
end

# *Feature 2: API - Viewing Game Score*
#
# Background: This story assumes the base data from running `rake db:seed`
#
# When I send a GET request to “/api/v1/games/1” I receive a JSON response as follows:
#
# ```{
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }```

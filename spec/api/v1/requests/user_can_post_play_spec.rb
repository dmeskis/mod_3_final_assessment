require 'rails_helper_development'

describe 'user can post a play' do
  it 'sends a post request with params and receives a 201 response' do
    post "/api/v1/games/1/plays?user_id=1&word=at"
    # post api_v1_game_plays_path(game_id: 1, user_id: 1, word: "at")
    expect(response).to be_successful
    expect(response.status_code).to eq(201)

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

# *Feature 3: API - Posting a Play*
#
# Background: This story assumes the base data from running `rake db:seed`
#
# You can choose to send the user_id and word specified below however you’d like or are comfortable.
#
# When I send a POST request to “/api/v1/games/1/plays” with a user_id=1 and word=at
# Then I should receive a 201 Created Response
#
# When I send a GET request to “/api/v1/games/1” I receive a JSON response as follows:
#
# ```{
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":17
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }```
# developer.oxforddictionaries.com
# Oxford Dictionaries API
# The Oxford Dictionaries API allows easy access to our world-renowned dictionary content. Use our live documentation to test the API and view sample code in Objective-C, Swift, and Java.

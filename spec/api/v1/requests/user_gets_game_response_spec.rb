require 'rails_helper'

describe 'user hits an api endpoint for game' do
  before :each do
    @josh = User.create(id: 1, name: "Josh")
    @sal = User.create(id: 2, name: "Sal")

    @game = Game.create(id: 1, player_1: @josh, player_2: @sal)

    @josh.plays.create(game: @game, word: "sal", score: 3)
    @josh.plays.create(game: @game, word: "zoo", score: 12)
    @sal.plays.create(game: @game, word: "josh", score: 14)
    @sal.plays.create(game: @game, word: "no", score: 2)
  end
  it 'returns a JSON response with data for that game' do
    binding.pry
    json_response = File.open("./fixtures/game.json")
    stub_request(:get, "https://localhost:3000/api/v1/games/1").
    to_return(status: 200, body: json_response)

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

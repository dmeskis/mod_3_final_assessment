require 'rails_helper'

describe Game do
  context "Instance methods" do
    context "#scores" do
      before :each do
        @josh = User.create(id: 1, name: "Josh")
        @sal = User.create(id: 2, name: "Sal")

        @game = Game.create(id: 1, player_1: @josh, player_2: @sal)

        @josh.plays.create(game: @game, word: "sal", score: 3)
        @josh.plays.create(game: @game, word: "zoo", score: 12)
        @sal.plays.create(game: @game, word: "josh", score: 14)
        @sal.plays.create(game: @game, word: "no", score: 2)
      end
      it "totals score" do
        game = Game.find(1).player_1_total_score
      end
    end
  end
end

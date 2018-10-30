require 'rails_helper_development'

describe Game do
  context "Instance methods" do
    context "#scores" do
      it "scores" do
        game = Game.find(1).player_1_total_score
      end
    end
  end
end

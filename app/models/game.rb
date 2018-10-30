class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays


  def player_1_total_score
    total = 0
    player_1.plays.each do |play|
      total += play.score
    end
    total
  end

  def player_2_total_score
    total = 0
    player_2.plays.each do |play|
      total += play.score
    end
    total
  end
end

class GameSerializer < ActiveModel::Serializer

  has_many :plays

  def game_id
    self.id
  end
end

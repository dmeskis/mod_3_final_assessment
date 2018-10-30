class Api::V1::GamesController < ApplicationController

  def show
    # binding.pry
    render json: Game.find(params[:id]).scores
  end
end

class Api::V1::Games::PlaysController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    binding.pry
    render status: 201
  end
end

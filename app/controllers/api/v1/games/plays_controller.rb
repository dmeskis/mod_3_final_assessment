class Api::V1::Games::PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @play = Play.new(user_id: params[:user_id],
                     game_id: params[:id],
                     word: params[:word])
    if @play.save
      render json: @play, status: 201
    else
      render json: @play, status: 400
    end
  end

end

class WelcomeController < ApplicationController
  def index
  end

  def show
    @word = params[:word]
    @word_facade = WordFacade.new(word_params)
  end

  private

    def word_params
      params.permit(:word)
    end
end

class WelcomeController < ApplicationController
  def index
  end

  def show
    @word_facade = WordFacade.new(params[:word])
  end
end

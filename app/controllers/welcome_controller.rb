class WelcomeController < ApplicationController
  def index
  end

  def show
    @word = params[:word]

    service = OxfordService.new(word_params)

    data = service.sentence_data
    canadian = data[0]["lexicalEntries"][0]["sentences"][1]
    british = data[0]["lexicalEntries"][0]["sentences"][4]
    canadian_sentences = canadian["text"]
    british_sentences = british["text"]


    binding.pry
    @word_facade = WordFacade.new(@word)
  end

  private

    def word_params
      params.permit(:word)
    end
end

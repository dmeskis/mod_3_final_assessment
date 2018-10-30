class WelcomeController < ApplicationController
  def index
  end

  def show
    @word = params[:word]
    conn = Faraday.new(:url => "https://od-api.oxforddictionaries.com/api/v1/") do |faraday|
      faraday.headers["Content-Type"] = "application/json;charset=utf-8"
      faraday.headers["app_id"] = "ff6a0588"
      faraday.headers["app_key"] = "4abdab620cd9faa0c2b457208b9fd2cf"
      faraday.adapter Faraday.default_adapter
    end

    # payload = {
    #   "word": params[:word]
    # }

    response = conn.get("entries/en/#{@word}/sentences")
    data = JSON.parse(response.body)
    canadian = data["results"][0]["lexicalEntries"][0]["sentences"][1]
    british = data["results"][0]["lexicalEntries"][0]["sentences"][4]
    canadian_sentences = canadian["text"]
    british_sentences = british["text"]


    binding.pry
    @word_facade = WordFacade.new(@word)
  end
end

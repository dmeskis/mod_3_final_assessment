class WordFacade

  def initialize(filter = {})
    @filter = filter
  end

  def canadian_sentences
    canadian_data["text"]
  end

  def british_sentences
    british_data["text"]
  end

  private

  def service
    OxfordService.new(@filter)
  end

  def canadian_data
    service.sentence_data[0]["lexicalEntries"][0]["sentences"][1]
  end

  def british_data
    service.sentence_data[0]["lexicalEntries"][0]["sentences"][4]
  end
end

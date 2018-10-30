class OxfordService

  def initialize(filter = {})
    @filter = filter
  end

  def sentence_data
    JSON.parse(response.body)["results"]
  end

  private

  def conn
    Faraday.new(:url => "https://od-api.oxforddictionaries.com/api/v1/") do |faraday|
      faraday.headers["Content-Type"] = "application/json;charset=utf-8"
      faraday.headers["app_id"] = "ff6a0588"
      faraday.headers["app_key"] = "4abdab620cd9faa0c2b457208b9fd2cf"
      faraday.adapter Faraday.default_adapter
    end
  end

  def response
    conn.get("entries/en/#{@filter[:word]}/sentences")
  end

end

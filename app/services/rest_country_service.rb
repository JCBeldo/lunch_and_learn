class RestCountryService
  def get_country(country)
    response = conn.get("/v3.1/name/#{country}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def get_random_country
    response = conn.get("/v3.1/all")
    json = JSON.parse(response.body, symbolize_names: true)
    random_country = json.sample[:name][:common]
  end

  private

  def conn
    Faraday.new("https://restcountries.com")
  end
end

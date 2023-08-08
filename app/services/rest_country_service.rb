class RestCountryService
  def get_country(country)
    response = conn.get("/v3.1/name/#{country}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://restcountries.com")
  end
end
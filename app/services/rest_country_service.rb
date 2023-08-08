class RestCountryService
  def get_country(country)
    response = country_conn.get("/v3.1/name/#{country}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def country_conn
    Faraday.new("https://restcountries.com")
  end
end
class RestCountryService
  def initialize(params)
    @country = params[:country]
  end

  def country_to_capital
    response = capital_conn.get("/#{@country}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def capital_conn
    Faraday.new("https://restcountries.com/v3.1/name")
  end
end

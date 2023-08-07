class ApiNinjaService
  def initialize(params)
    @country = params[:country]
  end

  def aqi_by_country(capital)
    response = conn.get("/#{capital}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private
  
  def conn
    Faraday.new("https://restcountries.com/v3.1/capital") do |f|
    end
  end 
end

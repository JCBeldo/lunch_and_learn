class ApiNinjaService
  def initialize(params)
    @country = params[:country]
  end

  def aqi_by_country
    response = conn.get("/#{@country}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private
  
  def conn
    Faraday.new("https://restcountries.com/v3.1/capital") do |f|
      f.headers['X-Api-Key'] = ENV['API_NINJA_KEY']
    end
  end 
end

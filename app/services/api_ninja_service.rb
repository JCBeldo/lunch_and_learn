class ApiNinjaService
  def initialize(params)
    @capital = 'taipei'
  end

  def aqi_by_capital
    response = conn.get("?") do |request|
      request.params[:country] = @capital
      request.headers['X-Api_Key'] = ENV['API_NINJA_KEY']
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private
  
  def conn
    Faraday.new("https://api.api-ninjas.com/v1/airquality") do |f|
      # f.headers['X-Api-Key'] = ENV['API_NINJA_KEY']
    end
  end 
end

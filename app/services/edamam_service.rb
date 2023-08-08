class EdamamService
  def initialize(params)
    @country = params
  end

  def recipes_by_keyword
    response = conn.get('?') do |request|
      request.params['q'] = @country
      request.params['app_id'] = ENV['app_id']
      request.params['app_key'] = ENV['app_key']
      request.params['type'] = "any"
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  private
  
  def conn
    Faraday.new("https://api.edamam.com/api/recipes/v2") do |f|
    end
  end 
end

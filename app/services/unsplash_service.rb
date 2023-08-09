class UnsplashService
  def conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH_API_KEY']
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['X-Total'] = '10'
    end
  end

  def get_photos(country)
    response = conn.get("/search/photos") do |request|
      request.params['query'] = country
      request.params['per_page'] = 10
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end

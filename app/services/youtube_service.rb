class YoutubeService
  def get_videos(country)
    response = conn.get("/youtube/v3/search") do |request|
      request.params['q'] = country
      request.params['part'] = 'snippet'
      request.params['maxResults'] = 1
      request.params['type'] = 'video'
      request.params['channelID'] = 'UCluQ5yInbeAkkeCndNnUhpw'
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://www.googleapis.com") do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end
end
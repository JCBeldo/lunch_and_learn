class YoutubeFacade 
  def country_videos(country)
    video_data = YoutubeService.new.get_videos(country)

    video_data[:items].map do |video|
      Youtube.new(video)
    end
  end
end

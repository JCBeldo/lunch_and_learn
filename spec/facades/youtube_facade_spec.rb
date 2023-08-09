require 'rails_helper'

RSpec.describe YoutubeFacade do
  it 'gets video data', :vcr do
    country = 'Thailand'
    videos = YoutubeFacade.new.country_videos(country)

    expect(videos).to be_an(Array)
    expect(videos.first).to be_an(Youtube)
  end
  
  it 'returns youtube objects with attributes', :vcr do
    country = 'Thailand'
    videos = YoutubeFacade.new.country_videos(country)

    expect(videos.first.title).to be_a(String)
    expect(videos.first.video_id).to be_a(String)
  end

  it 'returns an empty array if no videos are found', :vcr do
    country = '378924623h4jk234'
    videos = YoutubeFacade.new.country_videos(country)
    
    expect(videos).to eq([])
  end
end

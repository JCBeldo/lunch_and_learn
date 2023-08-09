require 'rails_helper'

RSpec.describe YoutubeService do
  it 'gets video data', :vcr do
    country = 'Laos'

    youtube_data = YoutubeService.new.get_videos(country)

    expect(youtube_data).to be_a(Hash)
    expect(youtube_data).to have_key(:items)

    youtube_data[:items].each do |data|
      expect(data).to have_key(:id)
      expect(data[:id]).to have_key(:videoId)
      expect(data[:id][:videoId]).to be_a(String)
      expect(data).to have_key(:snippet)
      expect(data[:snippet]).to have_key(:title)
      expect(data[:snippet][:title]).to be_a(String)
    end
  end
end

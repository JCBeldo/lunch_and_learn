require 'rails_helper'

RSpec.describe UnsplashService do
  describe 'it can connect to the Unsplash API' do
    it 'can get a list of photos', :vcr do
      photo_data = UnsplashService.new.get_photos('Thailand')

      expect(photo_data).to be_a(Hash)
      expect(photo_data).to have_key(:results)

      photo_data[:results].each do |data|
        expect(data).to have_key(:urls)
        expect(data[:urls]).to have_key(:regular)
        expect(data).to have_key(:alt_description)
      end

      
    end
  end
end
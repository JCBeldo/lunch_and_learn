require 'rails_helper'

RSpec.describe UnsplashFacade do
  describe 'class methods' do
    it 'returns a list of photos', :vcr do
      country = 'Romania'
      photos = UnsplashFacade.new.country_photos(country)

      expect(photos).to be_an(Array)
    end

    it 'returns a list of photo objects', :vcr do
      country = 'Romania'
      photos = UnsplashFacade.new.country_photos(country)

      expect(photos.first).to be_an(Photo)
      expect(photos.first.id).to eq(NilClass)
      expect(photos.first.url).to be_a(String)
      expect(photos.first.alt_tag).to be_a(String)
    end

    it 'returns an empty array if no photos are found', :vcr do
      country = '378924623h4jk234'
      photos = UnsplashFacade.new.country_photos(country)

      expect(photos).to eq([])
    end
  end
end

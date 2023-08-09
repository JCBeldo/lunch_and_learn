class UnsplashFacade
  def country_photos(country)
    json = UnsplashService.new.get_photos(country)
    json[:results].map do |photo|
      Photo.new(photo)
    end
  end
end
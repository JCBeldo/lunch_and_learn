class AqiSearchFacade
  def city_aqi(capital)
    aqi_search = ApiNinjaService.new.get_aqi(capital)
      aqi_hash = {
        id: nil,
        type: 'air quality',
        city: "#{capital}",
        attributes: aqi_search }

      AirQuality.new(aqi_hash, capital)
  end
end

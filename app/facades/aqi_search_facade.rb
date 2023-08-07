class AqiSearchFacade
  def initialize(params)
    @params = params
  end

  def capital_aqi
    aqi_search = ApiNinjaService.new(@params).aqi_by_country
    aqi_search.map do |aqi_data|
      aqi_hash = {
        id: nil,
        type: 'air quality',
        city: @params[:capital],
        attributes: aqi_data }

      AirQuality.new(aqi_hash)
    end
  end
end

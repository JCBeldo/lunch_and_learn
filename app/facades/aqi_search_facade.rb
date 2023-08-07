class AqiSearchFacade
  def initialize(params)
    @params = params
  end

  def capital_aqi
    aqi_search = ApiNinjaService.new(@params).aqi_by_capital
      aqi_hash = {
        id: nil,
        type: 'air quality',
        # city: @params[:capital],
        attributes: aqi_search }

      AirQuality.new(aqi_hash)
  end
end

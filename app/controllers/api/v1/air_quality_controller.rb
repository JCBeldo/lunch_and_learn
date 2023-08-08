class Api::V1::AirQualityController < ApplicationController
  def index
    country = params[:country]
    capital = CountrySearchFacade.new.capital_aqi(country)
    get_aqi = AqiSearchFacade.new.city_aqi(capital.capital)
    render json: AirQualitySerializer.new(get_aqi)
  end
end

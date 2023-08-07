class Api::V1::AirQualityController < ApplicationController
  def index
    get_aqi = AqiSearchFacade.new(params).capital_aqi
    render json: AirQualitySerializer.new(get_aqi)
  end
end
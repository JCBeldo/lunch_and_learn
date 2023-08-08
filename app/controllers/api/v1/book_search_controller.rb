class Api::V1::BookSearchController < ApplicationController
  def index
    country = params[:country]
    capital = CountrySearchFacade.new.capital_aqi(country)
    get_books = BookSearchFacade.new.city_aqi(capital.capital)
    render json: BookSerializer.new(get_books)
  end
end

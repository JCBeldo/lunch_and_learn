class Api::V1::BookSearchController < ApplicationController
  def index
    country = params[:location]
    capital = CountrySearchFacade.new.capital_city(country)
    get_books = BookSearchFacade.new.capital_books(capital.capital)
    render json: BookSerializer.new(get_books)
  end
end

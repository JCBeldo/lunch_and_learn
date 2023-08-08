class CountrySearchFacade
  def capital_city(country)
    capital_search = RestCountryService.new.get_country(country)
    x = Capital.new(capital_search)
  end
end

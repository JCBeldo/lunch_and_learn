class CountrySearchFacade
  def capital_city(country)
    capital_search = RestCountryService.new.get_country(country)
    require 'pry'; binding.pry
    Capital.new(capital_search)
  end
end

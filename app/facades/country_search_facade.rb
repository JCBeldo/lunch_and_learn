class CountrySearchFacade
  def initialize(params)
    @params = params
  end

  def capital_aqi
    capital_search = RestCountryService.new(@params).country_to_capital
      capital_hash = {
        id: nil,
        attributes: capital_search }

      Capital.new(capital_hash)
  end
end

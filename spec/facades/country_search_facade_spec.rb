require 'rails_helper'

RSpec.describe CountrySearchFacade do
  describe "class methods" do
    describe "#capital_aqi" do
      it "returns a capital object based in country" do

        capital = CountrySearchFacade.new.capital_city('Taiwan')
        expect(capital).to be_an(Object)
        expect(capital).to be_an(Capital)
        expect(capital.capital).to be_an(String)
        expect(capital.capital).to eq('Taipei')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe RestCountryService do
  describe "instance methods" do
    describe "#get_country" do
      it "returns a hash of recipes by country" do
        country = "Estonia"

        recipes = RestCountryService.new.get_country(country)
        expect(recipes[0]).to have_key(:capital)
        expect(recipes[0][:capital]).to be_an(Array)
        expect(recipes[0][:capital].first).to eq('Tallinn')
      end
    end

    describe "#get_random_country" do
      it "returns a random country string" do

        random_country = RestCountryService.new.get_random_country

        expect(random_country).to be_a(String)
      end
    end
  end
end

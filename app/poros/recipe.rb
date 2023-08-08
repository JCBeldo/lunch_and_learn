class Recipe
  attr_reader :title,
              :image,
              :url,
              :id,
              :type,
              :country
  
  def initialize(data, country)
    @country = country
    @id = data[:id]
    @type = data[:type]
    @title = data[:attributes][:recipe][:label]
    @image = data[:attributes][:recipe][:image]
    @url = data[:attributes][:recipe][:url]
  end
end

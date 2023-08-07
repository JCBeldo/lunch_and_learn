class Recipe
  attr_reader :title,
              :image,
              :url,
              :id,
              :type,
              :country
  
  def initialize(data)
    @id = data[:id]
    @type = data[:type]
    @title = data[:attributes][:recipe][:label]
    @image = data[:attributes][:recipe][:image]
    @url = data[:attributes][:recipe][:url]
    # @country = params[:q]
    @country = data[:attributes][:recipe][:shareAs].last(8)
  end
end
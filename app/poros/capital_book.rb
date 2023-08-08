class CapitalBook
  attr_reader :id,
              :type,
              :city,
              :title,
              :isbn,
              :publisher
              
  def initialize(data, capital)
    # require 'pry'; binding.pry
    @id = data[:id]
    @type = data[:type]
    @city = capital
    @title = data[:attributes][:docs][0][:title]
    @isbn = data[:attributes][:docs][0][:isbn]
    @publisher = data[:attributes][:docs][0][:publisher]
  end
end
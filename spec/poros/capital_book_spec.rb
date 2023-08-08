class CapitalBook
  attr_reader :id,
              :type,
              :city,
              :title,
              :isbn,
              :publisher
              
  def initialize(data, capital)
    @id = data[:id]
    @type = data[:type]
    @city = capital
    @title = data[:books][:title]
    @isbn = data[:books][:isbn]
    @publisher = data[:books][:publisher]
  end
end
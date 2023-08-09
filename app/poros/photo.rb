class Photo 
  attr_reader :id, :url, :alt_tag

  def initialize(data)
    @id = nil
    @url = data[:urls][:regular]
    @alt_tag = data[:alt_description]
  end
end
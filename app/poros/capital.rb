class Capital
  attr_reader :id,
              :capital

  def initialize(data)
  @id = data[:id]
  @capital = data[0][:capital]
  end
end

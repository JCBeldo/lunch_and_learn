class Capital
  attr_reader :capital

  def initialize(data)
  @capital = data[0][:capital].first
  end
end

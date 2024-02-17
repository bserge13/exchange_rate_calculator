class Currency 
  attr_reader :rate

  def initialize(data)
    @rate = data[:exchange_rate].round(2)
  end
end
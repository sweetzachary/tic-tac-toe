class Player
  def initialize(symbol, name)
    @symbol = symbol
    @name = name
  end

  attr_reader :symbol, :name
end

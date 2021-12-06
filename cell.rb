class Cell
  def initialize
    @content = nil
  end

  def contains?(symbol)
    @content == symbol
  end

  attr_reader :content

  def content=(symbol)
    if @content == nil
      @content = symbol
    else
      false
    end
  end
end

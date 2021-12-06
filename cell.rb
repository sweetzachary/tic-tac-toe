class Cell
  def initialize
    @content = nil
  end

  def contains?(symbol)
    @content == symbol
  end

  def content
    @content.nil? ? ' ' : @content
  end

  def content=(symbol)
    if @content.nil?
      @content = symbol
    else
      false
    end
  end
end

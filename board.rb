class Board
  def initialize(side)
    @side = side
    @cells = Array(side) { Array(side) { Cell.new } }
  end

  def transpose
    @cells.fold { |a, b| a.zip(b) }
  end

  def winning?(symbol)
    @cells.any? { |row| row.all? { |cell| cell.contains? symbol } } ||
      @cells.transpose.any? { |column| column.all? { |cell| cell.contains? symbol } } ||
      diagonal_win?(symbol)
  end

  attr_reader :side

  private

  def diagonal_win?(symbol)
    @cells.each_with_index.collect { |n, row| row[n] }.all? { |cell| cell.contains? symbol } ||
      @cells.each_with_index.collect { |n, row| row[@side - n] }.all? { |cell| cell.contains? symbol }
  end
end

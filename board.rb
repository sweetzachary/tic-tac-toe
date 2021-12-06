class Board
  def initialize(side)
    @side = side
    @cells = Array.new(side) { Array.new(side) { Cell.new } }
  end


  def winning?(symbol)
    @cells.any? { |row| row.all? { |cell| cell.contains? symbol } } ||
      @cells.transpose.any? { |column| column.all? { |cell| cell.contains? symbol } } ||
      diagonal_win?(symbol)
  end

  def put_symbol(number, symbol)
    col = number % @side
    row = number / @side
    @cells[row][col].content = symbol
  end

  def display
    @cells.each_with_index do |row, i|
      print_row(row)
      print_separator if i < @side - 1
    end
  end

  def full?
    @cells.all? { |row| row.none? { |cell| cell.content == ' ' } }
  end

  attr_reader :side

  private

  def print_separator
    0.upto(side - 1) { |i| i < @side - 1 ? print('-+') : puts('-') }
  end

  def print_row(row)
    row.each_with_index { |c, i| i < @side - 1 ? print("#{c.content}|") : puts(c.content) }
  end

  def transpose
    @cells.fold { |a, b| a.zip(b) }
  end

  def diagonal_win?(symbol)
    @cells.each_with_index.collect { |row, n| row[n] }.all? { |cell| cell.contains? symbol } ||
      @cells.each_with_index.collect { |row, n| row[@side - 1 - n] }.all? { |cell| cell.contains? symbol }
  end
end

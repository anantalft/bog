#http://learnruby.com/boggle/
class Board
  attr_reader :b_string, :board

  Die = [
  ['f', 'o', 'r', 'i', 'x', 'b'],
  ['m', 'o', 'q', 'a', 'b', 'j'],
  ['g', 'u', 'r', 'i', 'l', 'w'],
  ['s', 'e', 't', 'u', 'p', 'l'],
  ['c', 'm', 'p', 'd', 'a', 'e'],
  ['a', 'c', 'i', 't', 'a', 'o'],
  ['s', 'l', 'c', 'r', 'a', 'e'],
  ['r', 'o', 'm', 'a', 's', 'h'],
  ['n', 'o', 'd', 'e', 's', 'w'],
  ['h', 'e', 'f', 'i', 'y', 'e'],
  ['o', 'n', 'u', 'd', 't', 'k'],
  ['t', 'e', 'v', 'i', 'g', 'n'],
  ['a', 'n', 'e', 'd', 'v', 'z'],
  ['p', 'i', 'n', 'e', 's', 'h'],
  ['a', 'b', 'i', 'l', 'y', 't'],
  ['g', 'k', 'y', 'l', 'e', 'u']]

  def initialize
    indices = (0...Die.size).to_a.sort_by { rand }
    b_string = Die.values_at(*indices).map { |die| die[rand(die.size)] }
    @b_string = b_string
    @board =  b_string.join.chars.each_slice(4).map {|row| row}
  end


  def get_neighbors(row, col)
    n = []
    radial_offset_coords = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]
    ]

    radial_offset_coords.each do |row_offset, col_offset|
      try_row, try_col = row + row_offset, col + col_offset
      if inbounds? try_row, try_col
        n.append([try_row, try_col])
      end
    end
    n
  end

  private

  def inbounds? row, col
    row >= 0 && row <= 3 && col >= 0 && col <= 3
  end


end

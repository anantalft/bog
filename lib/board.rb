#http://learnruby.com/boggle/
class Board

  def initialize(b_string)
    @b_string = b_string
  end

  def build
    @b_string.chars.each_slice(4).map {|row| row}
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

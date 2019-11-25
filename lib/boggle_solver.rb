require 'pry'
class BoggleSolver

  def initialize board_string
    @board = board_string.chars.each_slice(4).map{ |row| row }
    @radial_offset_coords = [
    [-1,-1],[-1, 0],[-1, 1],
    [ 0,-1],        [ 0, 1],
    [ 1,-1],[ 1, 0],[ 1, 1]
    ]
  end

  def radial_search word, coords_used
    return true if word.empty?
    next_letter = word[0]
    row, col = coords_used.last

    @radial_offset_coords.each do |row_offset, col_offset|
      try_row, try_col = row + row_offset, col + col_offset
      next if !inbounds? try_row, try_col

      if valid_next_letter? try_row, try_col, next_letter, coords_used
        return true if radial_search(word[1..-1], coords_used << [try_row, try_col])
      end
    end
    false
  end

  def inbounds? row, col
    row >= 0 && row <= 3 && col >= 0 && col <= 3
  end

  def valid_next_letter? row, col, letter, coords_used
    @board[row][col] == letter && !coords_used.include?([row, col])
  end

  def solve word
    4.times do |row|
      4.times do |col|
        return true if radial_search word, [[row, col]]
      end
    end
    false
  end

end

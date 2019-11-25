require 'pry'
class Bo

  def initialize
    @board_ = Board.new
    @board = @board_.board_array
    @radial_offset_coords = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]
    ]
    @valid_words = []
  end

  def print_board
    @board
  end

  def valid_words
    @valid_words
  end

  def dfs(row, col, visited, trie, now_word)

    return if visited.include?([row, col])

      letter = @board[row][col].downcase
      visited.append([row, col])
      if trie.key?(letter)
        now_word += letter
        if trie[letter].empty?
          @valid_words << now_word
        end

        neighbors = get_neighbors(row, col)
        neighbors.each do |r, c|
          dfs(r, c, visited, trie[letter], now_word)
        end
      end

  end

  def get_neighbors(row, col)
    n = []
    @radial_offset_coords.each do |row_offset, col_offset|
      try_row, try_col = row + row_offset, col + col_offset
      if inbounds? try_row, try_col
        n.append([try_row, try_col])
      end
    end
    n
  end

  def inbounds? row, col
    row >= 0 && row <= 3 && col >= 0 && col <= 3
  end

  def main
    trie = @board_.dictionary_trie

    4.times do |row|
      4.times do |col|
         dfs(row, col, [], trie, '')
      end
    end
  end

end

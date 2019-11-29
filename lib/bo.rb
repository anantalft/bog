require 'board'
class Bo
  attr_reader :board, :valid_words

  def initialize(board_string, eng_dic_file_path )
    @board = Board.new(board_string).build
    @trie = Trie.new.build_dictionary_from(eng_dic_file_path)
    @valid_words = []
  end


  def solve
    4.times do |row|
      4.times do |col|
         dfs(row, col, [], @trie, '')
      end
    end
  end

  private

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

  def inbounds? row, col
    row >= 0 && row <= 3 && col >= 0 && col <= 3
  end

end

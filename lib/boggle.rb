require 'board'
class Boggle
  attr_reader :board, :trie, :v_words

  def initialize(board, trie)
    @board = board
    @trie = trie
    @v_words = []
  end


  def solve
    4.times do |row|
      4.times do |col|
        dfs([row, col], [], @trie, '')
      end
    end
  end

  private

  def dfs(row_col, visited, trie, now_word)
    return if visited.include?([row_col[0], row_col[1]])
    letter = @board.board[row_col[0]][row_col[1]].downcase
    visited.append([row_col[0], row_col[1]])
    if trie.key?(letter)
      now_word += letter
      if trie[letter].empty?
        @v_words << now_word
      end

      neighbors = @board.get_neighbors(row_col[0], row_col[1])
      neighbors.each do |r, c|
         dfs([r, c], visited, trie[letter], now_word)
      end
    end
  end

end

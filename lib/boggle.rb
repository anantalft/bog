require 'board'
class Boggle
  attr_reader :board, :trie

  def initialize(board, trie)
    @board = board
    @trie = trie
  end


  def solve
    v_words = []
    4.times do |row|
      4.times do |col|
        dfs(row, col, [], @trie, '', v_words)
      end
    end
    v_words
  end

  private

  def dfs(row, col, visited, trie, now_word,v_words)
    return if visited.include?([row, col])
    letter = @board.board[row][col].downcase
    visited.append([row, col])
    if trie.key?(letter)
      now_word += letter
      if trie[letter].empty?
        v_words << now_word
      end

      neighbors = @board.get_neighbors(row, col)
      neighbors.each do |r, c|
         dfs(r, c, visited, trie[letter], now_word,v_words)
      end
    end
  end


end

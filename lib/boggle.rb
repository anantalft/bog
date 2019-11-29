require 'board'
class Boggle
  attr_reader :board, :valid_words

  def initialize(board_string, eng_dic_file_path )
    @board_ = Board.new(board_string)
    @board = @board_.build
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

      neighbors = @board_.get_neighbors(row, col)
      neighbors.each do |r, c|
        dfs(r, c, visited, trie[letter], now_word)
      end
    end

  end

end

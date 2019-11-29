require 'trie'
class Board
  attr_accessor :board_array, :b_string

  def initialize
    b_string = (0...16).map { (65 + rand(26)).chr }.join
    #b_string = 'ABCDECOHBOKLBNOE'
    @board_array = b_string.chars.each_slice(4).map {|row| row}
  end


  def dictionary_trie
    words = []

    File.open("#{Rails.root}/files/letterpress_en_dictionary.txt") do |file|
      file.each do |line|
        words<<line.strip
      end
    end
    trie = Trie.new
    trie.build(words)
    return trie
  end

end

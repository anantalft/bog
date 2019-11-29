require 'trie'
class Board

  def initialize(b_string)
    @b_string = b_string
  end

  def build
    @b_string.chars.each_slice(4).map {|row| row}
  end


end

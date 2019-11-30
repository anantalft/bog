require 'boggle'
class Api::V1::BogglesController < ApplicationController

  def index
    solve_boggle
  end

  def show
  end

  private
  def solve_boggle

    board_string = (0...16).map { (65 + rand(26)).chr }.join
    board = Board.new(board_string)

    trie = Trie.new
    file_path = "#{Rails.root}/files/letterpress_en_dictionary.txt"
    trie.build_dictionary_from(file_path)

    @boggle = Boggle.new(board,trie)
    @valid_words = @boggle.solve
  end

end

require 'boggle'
class Api::V1::BogglesController < ApplicationController

  def index
    solve_boggle
  end

  def show
  end

  private
  def solve_boggle

    # board = Board.new('ABCDECOHBOKLBNOE')
    # trie = Trie.new
    # trie.build(['bob','aecok','cod'])
    # boggle = Boggle.new(board,trie)
    # binding.pry
    # boggle.v_words
    # # board_string = (0...16).map { (65 + rand(26)).chr }.join
    # # file_path = "#{Rails.root}/files/letterpress_en_dictionary.txt"
    # # @boggle = Boggle.new(board_string,file_path)
    # # @boggle.solve
    #
    board_string = (0...16).map { (65 + rand(26)).chr }.join
    file_path = "#{Rails.root}/files/letterpress_en_dictionary.txt"
    board = Board.new(board_string)
    trie = Trie.new
    trie.build_dictionary_from(file_path)
    @boggle = Boggle.new(board,trie)
    @valid_words = @boggle.solve
  end

end

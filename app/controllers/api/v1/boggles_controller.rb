require 'boggle'
require 'trie'
class Api::V1::BogglesController < ApplicationController

  def index
    solve_boggle
  end

  def show
  end

  private
  def solve_boggle

   # board_string = (0...16).map { (65 + rand(26)).chr }.join
    board = Board.new
   # session[:trie] = ""
    if session[:trie]
     trie = session[:trie]
    else
      trie = Trie.new
      file_path = "#{Rails.root}/files/words.txt"
      trie.build_dictionary_from(file_path)
      session[:trie] = trie
    end

    @boggle = Boggle.new(board,trie)
    @boggle.solve
  end

end


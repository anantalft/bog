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

    if !session[:trie]
      trie = Trie.new
      file_path = "#{Rails.root}/files/words.txt"
      trie.build_dictionary_from(file_path)
      session[:trie] = trie
    end

    @v_words = []

    while @v_words.length <1
      board = Board.new
      @boggle = Boggle.new(board,session[:trie])
      @boggle.solve
      @v_words = @boggle.v_words.uniq
    end
  end

end


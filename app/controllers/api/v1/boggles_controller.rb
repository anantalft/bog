require 'bo'
class Api::V1::BogglesController < ApplicationController

  def index
    solve_boggle
  end

  def show
  end

  private
  def solve_boggle
    board_string = (0...16).map { (65 + rand(26)).chr }.join
    file_path = "#{Rails.root}/files/letterpress_en_dictionary.txt"
    @bo = Bo.new(board_string,file_path)
    @bo.solve
  end

end

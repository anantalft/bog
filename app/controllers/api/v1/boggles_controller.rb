class Api::V1::BogglesController < ApplicationController

  def index
    generate_bo
  end

  def show
  end

  def generate_bo
    @bo = Bo.new
    @bo.main
  end

end

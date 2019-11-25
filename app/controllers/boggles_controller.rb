class BogglesController < ApplicationController
  before_action :set_boggle, only: [:show, :edit, :update, :destroy]

  # GET /boggles
  # GET /boggles.json
  def index
    @boggles = Boggle.all

    # board = "ABCDECOHBOKLBNOE"
    # board2 = "XXXAXPPXLXXXXEXX"
    # @solver = BoggleSolver.new(board)
    # @solver2 = BoggleSolver.new(board2)

    generate_bo

  end

  # GET /boggles/1
  # GET /boggles/1.json
  def show
  end

  # GET /boggles/new
  def new
    @boggle = Boggle.new
  end

  # GET /boggles/1/edit
  def edit
  end

  # POST /boggles
  # POST /boggles.json
  def create
    @boggle = Boggle.new(boggle_params)

    respond_to do |format|
      if @boggle.save
        format.html { redirect_to @boggle, notice: 'Boggle was successfully created.' }
        format.json { render :show, status: :created, location: @boggle }
      else
        format.html { render :new }
        format.json { render json: @boggle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boggles/1
  # PATCH/PUT /boggles/1.json
  def update
    respond_to do |format|
      if @boggle.update(boggle_params)
        format.html { redirect_to @boggle, notice: 'Boggle was successfully updated.' }
        format.json { render :show, status: :ok, location: @boggle }
      else
        format.html { render :edit }
        format.json { render json: @boggle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boggles/1
  # DELETE /boggles/1.json
  def destroy
    @boggle.destroy
    respond_to do |format|
      format.html { redirect_to boggles_url, notice: 'Boggle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boggle
      @boggle = Boggle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boggle_params
      params.require(:boggle).permit(:name, :board, :row, :col)
    end

  def generate_bo
    @bo = Bo.new
    @bo.main
    # while @bo.valid_words.length < 1
    #   @bo.main
    # end

  end
end

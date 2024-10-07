class BoardImportsController < ApplicationController
  before_action :set_board_import, only: %i[ show edit update destroy ]

  # GET /board_imports or /board_imports.json
  def index
    @board_imports = BoardImport.all
  end

  # GET /board_imports/1 or /board_imports/1.json
  def show
  end

  # GET /board_imports/new
  def new
    @board_import = BoardImport.new
  end

  # GET /board_imports/1/edit
  def edit
  end

  # POST /board_imports or /board_imports.json
  def create
    @board_import = BoardImport.new(board_import_params)

    respond_to do |format|
      if @board_import.save
        format.html { redirect_to board_import_url(@board_import), notice: "Board import was successfully created." }
        format.json { render :show, status: :created, location: @board_import }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board_import.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_imports/1 or /board_imports/1.json
  def update
    respond_to do |format|
      if @board_import.update(board_import_params)
        format.html { redirect_to board_import_url(@board_import), notice: "Board import was successfully updated." }
        format.json { render :show, status: :ok, location: @board_import }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board_import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_imports/1 or /board_imports/1.json
  def destroy
    @board_import.destroy

    respond_to do |format|
      format.html { redirect_to board_imports_url, notice: "Board import was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_import
      @board_import = BoardImport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_import_params
      params.require(:board_import).permit(:status, :file)
    end
end

class GotrasController < ApplicationController
  before_action :set_gotra, only: [:show, :edit, :update, :destroy]
before_action :user_role
  # GET /gotras
  # GET /gotras.json
  def index
    @gotras = Gotra.all
  end

  # GET /gotras/1
  # GET /gotras/1.json
  def show
  end

  # GET /gotras/new
  def new
    @gotra = Gotra.new
  end

  # GET /gotras/1/edit
  def edit
  end

  # POST /gotras
  # POST /gotras.json
  def create
    @gotra = Gotra.new(gotra_params)

    respond_to do |format|
      if @gotra.save
        format.html { redirect_to @gotra, notice: 'Gotra was successfully created.' }
        format.json { render :show, status: :created, location: @gotra }
      else
        format.html { render :new }
        format.json { render json: @gotra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gotras/1
  # PATCH/PUT /gotras/1.json
  def update
    respond_to do |format|
      if @gotra.update(gotra_params)
        format.html { redirect_to @gotra, notice: 'Gotra was successfully updated.' }
        format.json { render :show, status: :ok, location: @gotra }
      else
        format.html { render :edit }
        format.json { render json: @gotra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gotras/1
  # DELETE /gotras/1.json
  def destroy
    @gotra.destroy
    respond_to do |format|
      format.html { redirect_to gotras_url, notice: 'Gotra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gotra
      @gotra = Gotra.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gotra_params
      params.require(:gotra).permit(:name)
    end
end

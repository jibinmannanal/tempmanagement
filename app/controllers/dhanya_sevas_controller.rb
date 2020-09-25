class DhanyaSevasController < ApplicationController
  before_action :set_dhanya_seva, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  # GET /dhanya_sevas
  # GET /dhanya_sevas.json
  def index
    @dhanya_sevas = DhanyaSeva.all
  end

  # GET /dhanya_sevas/1
  # GET /dhanya_sevas/1.json
  def show
  end

  # GET /dhanya_sevas/new
  def new
    @dhanya_seva = DhanyaSeva.new
    @item_keys = DhanyaSeva.all&.pluck("item")&.flatten&.pluck("item")
  end

  # GET /dhanya_sevas/1/edit
  def edit
      @item_keys = DhanyaSeva.all&.pluck("item")&.flatten&.pluck("item")
  end

  # POST /dhanya_sevas
  # POST /dhanya_sevas.json
  def create
    puts dhanya_seva_params.inspect
    @dhanya_seva = current_user.dhanya_sevas.build(dhanya_seva_params)

    respond_to do |format|
      if @dhanya_seva.save
         flash[:success] = 'Dhanya seva was successfully created.'
        format.html { redirect_to dhanya_sevas_url }
        format.json { render :show, status: :created, location: @dhanya_seva }
      else
        format.html { render :new }
        format.json { render json: @dhanya_seva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dhanya_sevas/1
  # PATCH/PUT /dhanya_sevas/1.json
  def update
    respond_to do |format|
      if @dhanya_seva.update(dhanya_seva_params)
        format.html { redirect_to @dhanya_seva, notice: 'Dhanya seva was successfully updated.' }
        format.json { render :show, status: :ok, location: @dhanya_seva }
      else
        format.html { render :edit }
        format.json { render json: @dhanya_seva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dhanya_sevas/1
  # DELETE /dhanya_sevas/1.json
  def destroy
    @dhanya_seva.destroy
    respond_to do |format|
      format.html { redirect_to dhanya_sevas_url, notice: 'Dhanya seva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dhanya_seva
      @dhanya_seva = DhanyaSeva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dhanya_seva_params
      params.require(:dhanya_seva).permit(:remarks,:user_id,:total_worth,:name,:item=>[:item, :quantity])
    end
end

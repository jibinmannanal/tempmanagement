class SevaTypesController < ApplicationController
  before_action :set_seva_type, only: [:show, :edit, :update, :destroy]
 before_action :user_role
  # GET /seva_types
  # GET /seva_types.json
  def index
    @seva_types = SevaType.all
  end

  # GET /seva_types/1
  # GET /seva_types/1.json
  def show
  end

  # GET /seva_types/new
  def new
    @seva_type = SevaType.new
  end

  # GET /seva_types/1/edit
  def edit
  end

  # POST /seva_types
  # POST /seva_types.json
  def create
    @seva_type = SevaType.new(seva_type_params)

    respond_to do |format|
      if @seva_type.save
        flash[:success] = 'Seva type was successfully created.'

        format.html { redirect_to seva_types_url}
        format.json { render :show, status: :created, location: @seva_type }
      else
        format.html { render :new }
        format.json { render json: @seva_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seva_types/1
  # PATCH/PUT /seva_types/1.json
  def update
    respond_to do |format|
      if @seva_type.update(seva_type_params)
            flash[:success] = 'Seva type was successfully updated.'
        format.html { redirect_to seva_types_url }
        format.json { render :show, status: :ok, location: @seva_type }
      else
        format.html { render :edit }
        format.json { render json: @seva_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seva_types/1
  # DELETE /seva_types/1.json
  def destroy
    @seva_type.destroy
    respond_to do |format|
        flash[:success] = 'Seva type was successfully destroyed.'
      format.html { redirect_to seva_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seva_type
      @seva_type = SevaType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seva_type_params
      params.require(:seva_type).permit(:name,:group_booking, :maximum_number_per_booking)
    end
end

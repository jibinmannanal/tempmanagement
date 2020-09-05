class ExceptionDatesController < ApplicationController
  before_action :set_exception_date, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :user_role
  # GET /exception_dates.json
  def index
    @exception_dates = ExceptionDate.all
  end

  # GET /exception_dates/1
  # GET /exception_dates/1.json
  def show
  end

  # GET /exception_dates/new
  def new
    @exception_date = ExceptionDate.new
  end

  # GET /exception_dates/1/edit
  def edit
  end

  # POST /exception_dates
  # POST /exception_dates.json
  def create
    @exception_date = ExceptionDate.new(exception_date_params)

    respond_to do |format|
      if @exception_date.save
        format.html { redirect_to @exception_date, notice: 'Exception date was successfully created.' }
        format.json { render :show, status: :created, location: @exception_date }
      else
        format.html { render :new }
        format.json { render json: @exception_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exception_dates/1
  # PATCH/PUT /exception_dates/1.json
  def update
    respond_to do |format|
      if @exception_date.update(exception_date_params)
        format.html { redirect_to @exception_date, notice: 'Exception date was successfully updated.' }
        format.json { render :show, status: :ok, location: @exception_date }
      else
        format.html { render :edit }
        format.json { render json: @exception_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exception_dates/1
  # DELETE /exception_dates/1.json
  def destroy
    @exception_date.destroy
    respond_to do |format|
      format.html { redirect_to exception_dates_url, notice: 'Exception date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exception_date
      @exception_date = ExceptionDate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exception_date_params
      params.require(:exception_date).permit(:name, :dates=>[])
    end
end

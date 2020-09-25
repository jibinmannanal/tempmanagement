class SevasController < ApplicationController
  before_action :set_seva, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy,:edit, :update, :destroy]
   before_action :user_role, only: [:create, :destroy,:edit, :update, :destroy]
  # GET /sevas
  # GET /sevas.json
  def index
    @sevas = Seva.all
  end

  # GET /sevas/1
  # GET /sevas/1.json
  def show
  end

  # GET /sevas/new
  def new
    @seva = Seva.new
  end

  # GET /sevas/1/edit
  def edit
  end

  # POST /sevas
  # POST /sevas.json
  def create
    @seva = Seva.new(seva_params)

    respond_to do |format|
      if @seva.save
        msg = @seva.audit_logs
      h = Hash.new {|h, k| h[k] = []}
      h.merge!(msg) if msg.present?

        message = "Seva is created by #{logged_in_user&.name} at #{Time.now.try(:strftime, '%-d-%b-%Y at %I:%M%p')}"
        h['Data'] << {"message"=> message,"time"=>Time.now.strftime("%m/%d/%Y"),"params"=>seva_params }

        @seva.update(audit_logs:  h)
flash[:success] = 'Seva was successfully created.'
        format.html { redirect_to sevas_url }
        format.json { render :show, status: :created, location: @seva }
      else
        format.html { render :new }
        format.json { render json: @seva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sevas/1
  # PATCH/PUT /sevas/1.json
  def update
    respond_to do |format|
      if @seva.update(seva_params)
        flash[:success] = 'Seva was successfully updated.'
                format.html { redirect_to sevas_url }
          format.json { render :show, status: :ok, location: @seva }
      else
        format.html { render :edit }
        format.json { render json: @seva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sevas/1
  # DELETE /sevas/1.json
  def destroy
    @seva.destroy
    respond_to do |format|
      format.html { redirect_to sevas_url, notice: 'Seva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seva
      @seva = Seva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seva_params
        params.require(:seva).permit(:name, :instructions, :rate, :identification_number, :status, :audit_logs,:timing,:seva_type_id,:no_of_persons,:event_type,:tirtha_prasada_amount,:exception_date_ids=>[],:additional_data=>{})
    end
end

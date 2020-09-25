class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.includes(:seva)
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show


    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "Invoice No. #{@booking.id}",
            page_size: 'A4',
            template: "bookings/show.html.erb",
            layout: "pdf.html",
            orientation: "Landscape",
             viewport_size: '1280x1024',
            lowquality: true,
            zoom: 1,
            dpi: 75
        end
    end
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    puts params.inspect
    # hash.compact!
    users=[]

    params["beneficiary"].each do |devotee|
      if(devotee["visitor"]["name"].present?)
        users << devotee["visitor"]
      end
    end
    if users.length > 0
    @seva =Seva.find(params[:seva_id])
    if @seva.no_of_persons > 0
      rate = @seva.rate+ (session[:tirtha_prasada_count]*@seva.tirtha_prasada_amount)
    else
      rate = @seva.rate * session[:defaul_count] * session[:booking_dates].length
    end
    # rate = @seva.rate * users.length
    puts session[:booking_dates].inspect
    puts session[:tirtha_prasada_count].inspect
      puts session[:defaul_count].inspect
    if params["seva_booking_type"] == "singleday"

      if ([params["pooja_date"]] == session[:booking_dates])


          @booking = current_user.bookings.build(seva_id: params[:seva_id],devote_list: users,booking_type: "Normal",rate: rate ,seva_date: session[:booking_dates],tirtha_prasada_amount: session[:tirtha_prasada_count]*@seva.tirtha_prasada_amount,lunch: params[:lunch] ? true : false,tirtha_prasada_count: session[:tirtha_prasada_count]+ @seva.no_of_persons)
          if @booking.save
            session[:booking_dates] = nil
            puts "0000000000000000000000"
            @message = "Seva booked successfully"

          else
            puts "11111111111111111111111"
            @message = "Something went wrong. Please try again"

          end
      else
        @message = "Please check filled data is correct or not and try again"
      end
    else
      if  session[:booking_dates]
        @booking = current_user.bookings.build(seva_id: params[:seva_id],devote_list: users,booking_type: "Scheduled",rate: rate ,seva_date: session[:booking_dates])
        if @booking.save
          session[:booking_dates] = nil
          puts "0000000000000000000000"
          @message = "Seva booked successfully"

        else
          puts "11111111111111111111111"
          @message = "Something went wrong. Please try again"

        end

      else
        @message = "Please check filled data is correct or not and try again"
      end




    end
  else
    @message = "Please fill devotee details"

  end
#
#      "checkin"=>"2020-08-30", "poojadaytype"=>"regular", "start_date"=>"", "end_date"=>"", "booking"=>{"specificDate"=>["", "", ""]}, "controller"=>"bookings", "action"=>"create"} permitted: false>
# #<Booking id: nil, user_id: nil, seva_id: nil, devote_list: nil, booking_type: nil, rate: nil, seva_date: nil, created_at: nil, updated_at: nil>
#
#     #
    respond_to do |format|
if(@message == 'Seva booked successfully')
        format.js { flash[:success] = @message }
      else
  format.js { flash[:error] = @message }
      end
      # else
      #   format.html { render :new }
      #   format.json { render json: @booking.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def booking_pdf

       @invoice = Booking.find(params[:id])

       respond_to do |format|
           format.html
           format.pdf do
               render pdf: "Invoice No. #{@invoice.id}",
               page_size: 'A4',
               template: "booking/show.html.erb",
               layout: "pdf.html",
               orientation: "Landscape",
               lowquality: true,
               zoom: 1,
               dpi: 75
           end
       end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def booking_params
    #   params.fetch( {})
    # end
end

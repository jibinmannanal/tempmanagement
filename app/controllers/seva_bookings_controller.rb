class SevaBookingsController < ApplicationController
  before_action :logged_in_user
    before_action :admin_user,     only: :report_data
  def booking

    @family_members=[]
    @family_members.push({"name": current_user.name ,"nakshatra": current_user.nakshatra, "gotra": current_user.gotra  })
    current_user.family_members.each do |fm|
      @family_members.push({"name": fm.name ,"nakshatra": fm.nakshatra,"gotra": fm.gotra })

    end
    @seva=Seva.find(params[:seva_id])

  end
  def validate_booking_date
    @seva = Seva.find(params[:seva_id])
    date = params[:date]
    @count = params[:count]&.to_i
    if(@seva.additional_data['allowed_person_per_booking']&.to_i > 1)
      @count += 2
        end
    if @seva.event_type == 'regular'
      if @seva.exception_dates&.pluck(:dates)&.flatten&.uniq&.include?(date)
        @valid = false
      else
        @valid = true
      end
    elsif @seva.event_type == 'specific_day'
      if @seva&.additional_data['specificDate']&.include?(date)
        @valid = true
      else
        @valid = false
      end
    elsif @seva.event_type == 'every_week_on'
      date_day=date.to_date.strftime('%A')&.downcase
      if @seva.exception_dates&.pluck(:dates)&.flatten&.uniq&.include?(date)
        @valid = false
      elsif @seva&.additional_data['every_week_on']&.include?(date_day)
        @valid = true
      else
        # render json: {message: "This pooja is not avialiable on the selected date. Please select another date",valid: true}
        @valid = false
      end
    elsif @seva.event_type == 'every_month_specific_day'
      date_day=date.to_date.day

      if @seva.exception_dates&.pluck(:dates)&.flatten&.uniq&.include?(date)
        # render json: {message: "This pooja is not avialiable on the selected date. Please select another date",valid: true}
        @valid = false
      elsif @seva&.additional_data['specific_day']&.include?(date_day&.to_s)
        @valid = true
      else
        @valid = false
      end
    elsif @seva.event_type == 'repeating_interval'


      if @seva.exception_dates&.pluck(:dates)&.flatten&.uniq&.include?(date)
        @valid = false
      else
        starts =@seva&.additional_data['startDate']&.to_date
        seva_dates = []
        @seva&.additional_data['repeating_interval']&.each do |re|
          seva_dates << Montrose.daily(starts: starts, interval: re.to_i,until: Time.now+1.year).to_a
        end
        seva_date_list =[]
        seva_dates&.flatten.each do |datetime|
          seva_date_list << datetime.strftime("%Y-%m-%d")
        end
        puts seva_date_list.inspect
        if seva_date_list&.include?(date)
          @valid = true
        else
          @valid = false
        end
      end

    end
    if @valid
      session[:booking_dates] =[date]
      @selected_days = [date]
    else
      @selected_days = []
    end
  end

  def schedule_data_validation
    @seva=Seva.find(params[:seva_id])
    users=[]
    params["beneficiary"].each do |devotee|
      if(devotee["visitor"]["name"].present?)
        users << devotee["visitor"]
      end
    end
    @count = users.count
    exception_dates = @seva.exception_dates&.pluck(:dates)&.flatten
    if(params["poojadaytype"] == 'specific_day')
      @selected_days = params["booking"]["specificDate"].select(&:presence)
      # render json: {dates: @selected_days }
    elsif (params["poojadaytype"] == 'regular')
      dd= @seva.additional_data["every_week_on"] - ["0"]

      specific_dates_sym = dd.map &:to_sym

      devotee_seva_dates = Montrose.daily(starts: params[:start_date].to_date, interval: 1,until: params[:end_date].to_date).to_a
      @seva_date_list =[]
      devotee_seva_dates&.flatten.each do |datetime|
        @seva_date_list << datetime.strftime("%Y-%m-%d")
      end
      if @seva.event_type == 'regular'
        @selected_days = @seva_date_list - exception_dates
        # render json: {dates: @selected_days }
      elsif @seva.event_type == 'specific_day'
        dates = @seva&.additional_data['specificDate']
        @selected_days  = dates & @seva_date_list
        # render json: {dates: @selected_days }
      elsif @seva.event_type == 'every_week_on'
        dates =  Montrose.weekly(on: specific_dates_sym,
          between: params[:start_date].to_date..params[:end_date].to_date).to_a
          day_list=[]

          dates&.flatten.each do |datetime|
            day_list << datetime.strftime("%Y-%m-%d")
          end

          @selected_days  = (day_list & @seva_date_list) -  exception_dates
          # render json: {dates: @selected_days }
        elsif @seva.event_type == 'every_month_specific_day'

          dates = Montrose.every(:month, mday: @seva&.additional_data['specific_day'].map(&:to_i),between: params[:start_date].to_date..params[:end_date].to_date).to_a
          day_list=[]
          dates&.flatten.each do |datetime|
            day_list << datetime.strftime("%Y-%m-%d")

          end

          @selected_days  = (day_list & @seva_date_list) -  exception_dates

          # render json: {dates: @selected_days }
        end


      else
        dd= @seva&.additional_data["every_week_on"] - ["0"]

        specific_dates_sym = dd.map &:to_sym
        s=params[:week_day].map &:to_sym
        devotee_seva_dates = Montrose.weekly(on: s,
          between: params[:start_date].to_date..params[:end_date].to_date).to_a

          @seva_date_list =[]
          devotee_seva_dates&.flatten.each do |datetime|
            @seva_date_list << datetime.strftime("%Y-%m-%d")
          end
          if @seva.event_type == 'regular'
            @selected_days = @seva_date_list - exception_dates
            # render json: {dates: @selected_days }
          elsif @seva.event_type == 'specific_day'
            dates = @seva&.additional_data['specificDate']
            @selected_days  = dates & @seva_date_list
            # render json: {dates: @selected_days }
          elsif @seva.event_type == 'every_week_on'

            dates =  Montrose.weekly(on: specific_dates_sym,
              between: params[:start_date].to_date..params[:end_date].to_date).to_a
              day_list=[]

              dates&.flatten.each do |datetime|
                day_list << datetime.strftime("%Y-%m-%d")
              end

              @selected_days  = (day_list & @seva_date_list) -  exception_dates
              # render json: {dates: @selected_days }
            elsif @seva.event_type == 'every_month_specific_day'

              dates = Montrose.every(:month, mday: @seva&.additional_data['specific_day'].map(&:to_i),between: params[:start_date].to_date..params[:end_date].to_date).to_a
              day_list=[]
              dates&.flatten.each do |datetime|
                day_list << datetime.strftime("%Y-%m-%d")

              end

              @selected_days  = (day_list & @seva_date_list) -  exception_dates

              # render json: {dates: @selected_days }

            end

          end
          session[:booking_dates] = @selected_days

        end

        def remove_booked_date
          puts session[:booking_dates].inspect
          if(params[:date])
            session[:booking_dates].delete(params[:date])
            @selected_days = session[:booking_dates]
            @seva = Seva.find(params[:seva_id])
            session[:booking_dates] =@selected_days
            @count = params[:count].to_i

          end
        end

        def report_data


          date = Time.now.strftime("%Y-%m-%d")

          @datas =  Booking.where("seva_date ?| array[:values]",values: date).group_by(&:seva_id)
        end

        def report_data_js

          date = params[:date]

          @datas =  Booking.where("seva_date ?| array[:values]",values: date).group_by(&:seva_id)

        end

        def clear_booking_data
          session[:booking_dates] = nil
        end

        private
        def admin_user
          redirect_to(root_url) unless current_user.role?('admin') || current_user.role?('manager')
        end
      end

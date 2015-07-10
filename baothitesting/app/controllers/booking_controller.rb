class BookingController < ApplicationController
  def create
    seater_number     = params[:booking][:seater_number]
    address           = params[:booking][:address]
    data = Service.create_booking(seater_number,address,session[:auth_token])
    if data["status"].to_i == 200
      redirect_to booking_show_path(:booking_id => data["booking"]["id"])
    else
      redirect_to root_path, notice: data["errors"]
    end
  end

  def show
    data = Service.show_booking(session[:auth_token],params[:booking_id])
    if data["status"].to_i == 200
      @booking = data["booking"]
    else
      redirect_to root_path, notice: "System error"
    end
  end

  def yourbooking
    data = Service.user_booking(session[:auth_token])
    if data["status"].to_i == 200
      @bookings = data["bookings"]
    else
      redirect_to root_path, notice: "System error"
    end
    
  end
end

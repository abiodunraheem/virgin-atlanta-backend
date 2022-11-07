class Api::V1::ReservationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.includes(:doctor)
    render json: @reservations.as_json(include: :doctor)
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation = Reservation.all
  end

  
  private

  def reservation_params
    params.permit(:date, :city, :flight_id, :user_id)
  end
end

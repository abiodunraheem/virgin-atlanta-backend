class Api::V1::FlightsController < ApplicationController
  def index
    @flights = Flight.all
    render json: @flights
  end

  def show
    @flight = Flight.find(params[:id])
    render json: { flight: @flight }, status: :ok
  end

  
  private

  def flight_params
    params.permit(:user_id, :name, :avatar, :price)
  end
end

class Api::V1::FlightsController < ApplicationController
  def index
    @flights = Flight.all
    render json: @flights
  end

  def show
    @flight = Flight.find(params[:id])
    render json: { flight: @flight }, status: :ok
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      render json: { status: 201, message: 'flight created successfully!', content: { flight: @flight } }
    else
      render json: { error: 401, message: ' flight cannot be processed !' }
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    if @flight.destroy!
      render json: { success: 'The flight has been deleted successfully' }, status: :ok
    else
      render json: { error: 'There was an error, please try again!' }, status: :internal_server_error
    end
  end

  private

  def flight_params
    params.permit(:user_id, :name, :avatar, :price)
  end
end

class Api::V1::FlightsController < ApplicationController
  before_action :set_flight, only: %i[show update destroy]

  # GET /flights
  def index
    @flights = Flight.all
    render json: @flights
  end

  # GET /flights/1
  def show
    @flight = Flight.find(params[:id])
    render json: { flight: @flight }, status: :ok
    # render json: @flight
  end

  # POST /flights
  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      render json: { status: 201, message: 'flight created successfully!', content: { flight: @flight } }
      # render json: @flight, status: :created, location: @flight
    else
      render json: { error: 401, message: ' flight cannot be processed !' }
      # render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1
  def update
    if @flight.update(flight_params)
      render json: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /flights/1
  def destroy
    @flight = Flight.find(params[:id])
    if @flight.destroy!
      render json: { success: 'The flight has been deleted successfully' }, status: :ok
    else
      render json: { error: 'There was an error, please try again!' }, status: :internal_server_error
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_flight
    @flight = Flight.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def flight_params
    params.require(:flight).permit(:user_id, :name, :avatar, :cost)
  end
end

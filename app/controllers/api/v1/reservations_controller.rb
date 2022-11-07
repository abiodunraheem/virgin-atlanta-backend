class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  # GET /reservations/1
  def show
    @reservation = Reservation.find(params[:id])
    render json: { reservation: @reservation }, status: :ok
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: { status: 201, message: 'reservation created successfully!', content: { reservation: @reservation } }
      # render json: @reservation, status: :created, location: @reservation
    else
      render json: { error: 401, message: ' reservation cannot be processed !' }
      # render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy!
      render json: { success: 'The reservation has been deleted successfully' }, status: :ok
    else
      render json: { error: 'There was an error, please try again!' }, status: :internal_server_error
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:user_id, :flight_id, :date, :city)
  end
end

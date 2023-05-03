class Api::V1::ReservationController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    render json: @reservations
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservations
    else
      render error: { error: 'Unable to create Reservation.' }, status: 400
    end
  end

  def update
    if @reservation
      @reservation.update(reservation_params)
      render json: { messagge: 'Reservation was successfully updated.' }, stauts: 200
    else
      render error: { error: 'Unable to create Reservation.' }, status: 400
    end
  end

  def destroy
    if @reservation
      @reservation.destroy
      render json: { messagge: 'Reservation was successfully updated.' }, stauts: 200
    else
      render error: { error: 'Unable to create Reservation.' }, status: 400
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:name, :email, :phone, :party_size, :reservation_date, :user_id, :restaurant_id)
  end
end

class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    table = Table.where(restaurant_id: params[:restaurant_id])
    @reservations = Reservation.where(table_id: table)
    # @reservations = Reservation.all
    render json: @reservations
  end

  def show
    render json: @reservation
  end

  def new
    @user = User.new
  end


  def create
    @reservation = Reservation.new(reservation_params)
    resultado = Reservation.where(booking_date: params[:booking_date]).select {|reserva| reserva.table.restaurant_id == params[:restaurant_id]}.count
    # p resultado = Reservation.where(booking_date: params[:booking_date])
    if resultado <= 2
      @reservation.save
      render json: { messagge: 'Creado correctamente' }, status: 200
    else
      # render json: { error: @reservation.errors.full_messages.join(", ") }, status: :unprocessable_entity
      render json: { error: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
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
      render json: { messagge: 'Reservation was successfully delate.' }, stauts: 200
    else
      render error: { error: 'Unable to create Reservation.' }, status: 400
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:group_size, :booking_date, :user_id, :table_id)
  end
end

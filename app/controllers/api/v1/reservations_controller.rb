class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]
  before_action :check_login, only: %i[create]
  before_action :check_owner, only: %i[update destroy]

  def index
    table = Table.where(restaurant_id: params[:restaurant_id])
    @reservations = Reservation.where(table_id: table)
    # @reservations = Reservation.all
    render json: ReservationSerializer.new(@reservations).serializable_hash
  end

  def show
    options = { include: [:user, :table] }
    render json: ReservationSerializer.new(@reservation, options).serializable_hash
  end

  # def create
  #   @reservation = Reservation.new(reservation_params)
  #   resultado = Reservation.where(booking_date: params[:booking_date]).select { |reserva| reserva.table.restaurant_id == params[:restaurant_id] }.count
  #   # p resultado = Reservation.where(booking_date: params[:booking_date])
  #   if resultado <= 2 && @reservation.save
  #     render json: { messagge: 'Creado correctamente' }, status: 200
  #   else
  #     # render json: { error: @reservation.errors.full_messages.join(", ") }, status: :unprocessable_entity
  #     render json: { error: @reservation.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    resultado = Reservation.where(booking_date: params[:booking_date]).select { |reserva| reserva.table.restaurant_id == params[:restaurant_id] }.count
    # p resultado = Reservation.where(booking_date: params[:booking_date])
    # resultado = Reservation.where(booking_date: "2023/5/28").select { |reserva| reserva.table.restaurant_id == params[:restaurant_id] }.count
    if resultado <= 15 && @reservation.save
      render json: ReservationSerializer.new(@reservation).serializable_hash, status: :created
    else
      # render json: { error: @reservation.errors.full_messages.join(", ") }, status: :unprocessable_entity
      render json: { error: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    if @reservation.update(reservation_params)
      render json: ReservationSerializer.new(@reservation).serializable_hash
    else
      render json: @reservation.errors, status:
      :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: { messagge: 'Reservation was successfully deleted.' }, stauts: 200
    else
      render error: { error: 'Unable to create Reservation.' }, status: 400
    end
  end

  private

  def check_owner
    head :forbidden unless @reservation.user_id == current_user&.id
  end

  def set_reservation
    @reservation = Reservation.find_by_id(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:group_size, :booking_date, :user_id, :table_id)
  end
end

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table

  # validate :validate_max_reservations_per_restaurant_per_day
  validate :validate_max_reservations


  # def validate_max_reservations_per_restaurant_per_day(fecha)
  #   resultado = Reservation.where(booking_date: fecha).select {|reserva| reserva.table.restaurant_id==8}.count
  #     # errors.add(:base, "No se pueden crear más de 15 reservas para el restaurante xxx en el día seleccionado.")
  # end

  def validate_max_reservations
    if Reservation.count >= 20
      errors.add(:base, "No se pueden crear más de 20 reservaciones entre todos los restaurantes")
    end
  end
end

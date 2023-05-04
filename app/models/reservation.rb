class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table

  # validate :validate_max_reservations_per_restaurant_per_day
  validate :validate_max_reservations

  private

  # def validate_max_reservations_per_restaurant_per_day
  #   if reservation.tables.count >= 5
  #     errors.add(:base, "No se pueden crear más de 15 reservas para el restaurante #{restaurant.name} en el día seleccionado.")
  #   end
  # end

  def validate_max_reservations
    if Reservation.where('booking_day >= ?', booking_date.all_day).count >= 10
      errors.add(:base, "No se pueden crear más de 20 reservaciones entre todos los restaurantes")
    end
  end
end
